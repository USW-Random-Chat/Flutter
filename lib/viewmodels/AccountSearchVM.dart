import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountSearchVM extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  bool emailSent = false;

  // accout 찾기
  Future<void> sendIDEmail() async {
    final url = Uri.parse(
        'http://43.202.91.160:8080/open/member/find-account?email=${emailController.text}');
    final response = await http.post(url);

    if (response.statusCode == 200 && response.body.contains('true')) {
      emailSent = true;
    } else {
      emailSent = false;
    }
    notifyListeners();
  }
}

class PasswordSearchVM extends ChangeNotifier {
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController validationCodeController =
      TextEditingController();
  bool emailSent = false;
  bool codeVerified = false;
  String uuid = '';

  // 인증코드 전송 함수
  Future<void> sendRecoveryCode() async {
    final url = Uri.parse('http://43.202.91.160:8080/open/member/send-code');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'account': idController.text,
        'email': emailController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody.containsKey('uuid')) {
        uuid = responseBody['uuid'];
        emailSent = true;
      } else {
        emailSent = false;
      }
    } else {
      emailSent = false;
    }
    notifyListeners();
  }

  // 인증코드 확인 함수
  Future<void> verifyRecoveryCode() async {
    final url = Uri.parse(
        'http://43.202.91.160:8080/verification/verify-code?uuid=$uuid&verificationCode=${validationCodeController.text}');
    final response = await http.post(url);

    if (response.statusCode == 200 && response.body.contains('true')) {
      codeVerified = true;
    } else {
      codeVerified = false;
    }
    notifyListeners();
  }

  // 입력 초기화
  void clearInput() {
    idController.clear();
    emailController.clear();
    validationCodeController.clear();
    emailSent = false;
    codeVerified = false;
    uuid = '';
    notifyListeners();
  }
}
