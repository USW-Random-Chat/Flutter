import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  String _id = '';
  String _password = '';
  String _email = '';

  bool _idError = false;
  bool _pwError = false;
  bool _emailError = false;
  bool _pwMatch = false;
  bool _isEmailValid = true;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwMatchController = TextEditingController();

  bool get idError => _idError;
  bool get pwError => _pwError;
  bool get emailError => _emailError;
  bool get pwMatch => _pwMatch;
  bool get isEmailValid => _isEmailValid;
  bool _passwordVisible1 = true;
  bool get passwordVisible1 => _passwordVisible1;
  bool _passwordVisible2 = true;
  bool get passwordVisible2 => _passwordVisible2;

  void validateIdInput(String value) {
    if (value.length >= 4 && value.length <= 16) {
      _idError = false;
    } else {
      _idError = true;
    }
    notifyListeners();
  }

  void validatePwInput(String value) {
    if (value.length >= 6 && value.length <= 20) {
      _pwError = false;
    } else {
      _pwError = true;
    }
    notifyListeners();
  }

  void validatePwMatch(String value) {
    if (pwController.text != value) {
      _pwMatch = true;
    } else {
      _pwMatch = false;
    }
    notifyListeners();
  }

  void togglePasswordVisibility1() {
    _passwordVisible1 = !_passwordVisible1;
    notifyListeners();
  }

  void togglePasswordVisibility2() {
    _passwordVisible2 = !_passwordVisible2;
    notifyListeners();
  }

  bool validateEmail(String value) {
    final RegExp emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    _isEmailValid = emailRegExp.hasMatch(value);
    notifyListeners();
    return _isEmailValid;
  }

  Future<void> signup() async {
    if (validateEmail(_email) && !_idError && !_pwError && _pwMatch) {
      // 회원가입 로직을 여기에 구현하면 됩니다.
      // 예: API 호출, 데이터 저장 등
      String id = _id;
      String password = _password;
      String email = _email;

      print('id: $id');
      print('Password: $password');
      print('email: $email');
    }
  }
}
