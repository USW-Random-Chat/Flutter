import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class MatchingViewModel extends ChangeNotifier {
  StompClient? _stompClient;
  bool _isMatched = false;
  bool _isMatching = false;
  String? _chatRoomId;
  String account = "admin";

  bool get isMatched => _isMatched;
  bool get isMatching => _isMatching;
  String? get chatRoomId => _chatRoomId;

  void connectStomp() {
    _stompClient = StompClient(
      config: StompConfig(
        url: 'ws://43.202.91.160:8080/stomp',
        onConnect: (StompFrame frame) {
          print('STOMP connected');
        },
        onWebSocketError: (dynamic error) => print('STOMP error: $error'),
      ),
    );
    _stompClient?.activate();
  }

  void requestMatch(String account) {
    _stompClient?.send(destination: '/pub/queue/match/in/{$account}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isMatching = true;
      notifyListeners();
    });

    _stompClient?.subscribe(
      destination: '/queue/match/in/{$account}',
      callback: (StompFrame frame) {
        if (frame.body != null) {
          if (frame.body!.contains('매칭')) {
            print('매칭 성공: ${frame.body}');
          } else {
            print('매칭 실패: ${frame.body}');
          }
        }
        final chatRoomId = frame.body;
        if (chatRoomId != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _chatRoomId = chatRoomId;
            _isMatched = true;
            _isMatching = false;
            notifyListeners();
            print('매칭이 완료되었습니다. 채팅방 ID: $chatRoomId');
          });
        }
      },
    );
  }

  void cancelMatch(String account) {
    _stompClient?.send(destination: '/pub/queue/match/cancel/{$account}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isMatching = false;
      notifyListeners();
    });

    _stompClient?.subscribe(
      destination: '/queue/match/cancel/{$account}',
      callback: (StompFrame frame) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _isMatched = false;
          _isMatching = false;
          notifyListeners();
          print('매칭이 취소되었습니다.');
        });
      },
    );
  }

  @override
  void dispose() {
    _stompClient?.deactivate();
    super.dispose();
  }
}
