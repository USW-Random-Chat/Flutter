import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import 'dart:convert';
import 'package:suwon/models/chat_model.dart';

class ChatViewModel extends ChangeNotifier {
  late StompClient stompClient;
  List<Message> messages = [];

  ChatViewModel() {
    // 생성자에서 StompClient 초기화
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://43.202.91.160:8080/stomp',
        onConnect: (StompFrame frame) {
          print('Connected to the server');
          // 연결 성공 후 구독 시작
          subscribeToChannel();
        },
        beforeConnect: () async {
          print('connecting to the server...');
        },
        stompConnectHeaders: {'Authorization': 'Bearer your_token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer your_token'},
      ),
    );
    stompClient.activate();
  }

  void subscribeToChannel() {
    // 구독 시작 메소드
    stompClient.subscribe(
      destination: '/sub/chat/room/1234',
      callback: (frame) {
        var message = Message.fromJson(json.decode(frame.body!));
        messages.add(message);
        notifyListeners();
      },
    );
  }

  void sendMessage(String contents) {
    stompClient.send(
      destination: '/pub/chat/message/1234',
      body: json.encode({'contents': contents}),
    );
  }

  @override
  void dispose() {
    stompClient.deactivate();
    super.dispose();
  }
}
