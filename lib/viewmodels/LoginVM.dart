import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suwon/models/user_model.dart';

class LoginVM extends ChangeNotifier {
  String _loginResult = '';
  String get loginResult => _loginResult;

  // 사용자 ID 및 비밀번호를 저장하는 변수들
  String _userid = '';
  String _userpw = '';

  // 사용자 ID를 업데이트하는 메서드
  void setUserid(String value) {
    _userid = value;
  }

  // 사용자 비밀번호를 업데이트하는 메서드
  void setUserpw(String value) {
    _userpw = value;
  }

  Future<void> login() async {
    try {
      final apiUrl = Uri.parse('http://3.35.83.91:8080/member/sign-in');
      final requestBody = {
        "memberId": _userid,
        "password": _userpw,
      };

      final response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['success'] != null && data['success']) {
          _loginResult = '아이디 또는 비밀번호가 다릅니다';
          print('서버 응답 바디: ${response.body}');
        } else {
          _loginResult = '로그인 성공';
          print('서버 응답 바디: ${response.body}');
        }
      } else {
        _loginResult = '서버 오류: ${response.statusCode}';
      }
    } catch (error) {
      _loginResult = '오류: $error';
    }

    // 상태가 변경되었음을 알림
    notifyListeners();
  }
}
