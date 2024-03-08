import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String _userid = '';
  String _userpw = '';

  String get userid => _userid;
  String get userpw => _userpw;

  void setUserid(String value) {
    _userid = value;
    notifyListeners();
  }

  void setUserpw(String value) {
    _userpw = value;
    notifyListeners();
  }

  Future<bool> login() async {
    // 여기에서 실제 로그인 로직을 수행하고 결과를 반환합니다.
    // 예를 들어, 서버와 통신하여 사용자 인증을 검증할 수 있습니다.
    await Future.delayed(Duration(seconds: 2)); // 가상의 지연 시간 추가

    // 가상의 로그인 결과 반환
    return _userid == 'userid' && _userpw == 'userpw';
  }
}
