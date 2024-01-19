import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatViewModel extends ChangeNotifier {
  bool isChatButtonEnabled = false;

  void updateChatButtonState(String text) {
    // 입력된 문자열이 하나라도 있는 경우 버튼 활성화
    isChatButtonEnabled = text.isNotEmpty;
    notifyListeners();
  }
}
