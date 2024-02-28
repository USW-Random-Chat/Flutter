import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'dart:convert';
import 'package:suwon/models/chat_model.dart';

class ChatViewModel extends ChangeNotifier {
  StompClient? client;
  String serverUrl = 'ws://3.35.83.91:8080/stomp';
  String sendEndpoint = '/pub/chat/message/1234';
  List<Message> chatMessages = [];

  ChatViewModel() {
    client = StompClient(
      config: StompConfig(
        url: serverUrl,
        onConnect: onConnect,
        onWebSocketError: (dynamic error) => print(error.toString()),
      ),
    );
  }

  void initialize() {
    client!.activate();
  }

  void onConnect(StompFrame frame) {
    client!.subscribe(
      destination: '/sub/chat/room/1234',
      callback: (StompFrame frame) {
        if (frame.body != null) {
          Map<String, dynamic> jsonData = json.decode(frame.body!);
          Message message = Message.fromJson(jsonData);
          chatMessages.add(message);
          notifyListeners(); // 새로운 메시지가 추가될 때마다 호출
        }
        print('채팅');
      },
    );
  }

  void sendMessage(String message) {
    client!.send(
      destination: sendEndpoint,
      body: json.encode(
          Message(roomId: '1234', sender: 'your_name', contents: message)
              .toJson()),
    );
  }
}
