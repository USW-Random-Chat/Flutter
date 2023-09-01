import 'package:flutter/material.dart';

class AccountRecoveryViewModel extends ChangeNotifier {
  String _id = '';
  String _password = '';
  String _email = '';
  String _validationCode = '';


  bool _idError = false;
  bool _pwError = false;
  bool _emailError = false;
  bool _pwMatch = false;
  bool _isEmailValid = true;
  bool _isValidationCodeError = false;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwMatchController = TextEditingController();
  TextEditingController ValidationCodeController = TextEditingController();


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
      _pwMatch = false;
    } else {
      _pwMatch = true;
    }
    notifyListeners();
  }

  void validateCodeMatch(String value) {
    if (ValidationCodeController.text != value) {
      _isValidationCodeError = true;
    } else {
      _isValidationCodeError = false;
    }
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

  Future<void> Search_ID() async {
    if (validateEmail(_email)) {
      // 이메일 전송 로직
      //
      String email = _email;
      print('eamil: $email');

    }
  }
  Future<void> Search_PW() async {
    if(validateEmail(_email)&& !_idError) {
      // 이메일 및 ID 검증
      // 인증코드 전송 및 검증
      String id = _id;
      String email = _email;
      String validationCode = _validationCode;

      print('id: $id');
      print('email: $email');
      print('validationCode = $validationCode');
    }
  }
}