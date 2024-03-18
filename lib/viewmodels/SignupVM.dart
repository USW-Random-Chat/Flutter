import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suwon/models/user_model.dart';
import 'dart:convert';

class SignupVM extends ChangeNotifier {
  String id = '';
  String password = '';
  String email = '';
  String nickname = '';

  bool btActivation = true;
  bool _idError = false;
  bool _pwError = false;
  bool _emailError = false;
  bool _pwMatch = false;
  bool _isEmailValid = true;
  bool _nicknameError = false;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwMatchController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController mbtiController = TextEditingController();
  TextEditingController selfController = TextEditingController();

  bool get idError => _idError;
  bool get pwError => _pwError;
  bool get emailError => _emailError;
  bool get pwMatch => _pwMatch;
  bool get isEmailValid => _isEmailValid;
  bool _passwordVisible1 = true;
  bool get passwordVisible1 => _passwordVisible1;
  bool _passwordVisible2 = true;
  bool get passwordVisible2 => _passwordVisible2;
  bool get nicknameError => _nicknameError;

  void validateIdInput(String value) {
    if (value.length >= 4 && value.length <= 16) {
      _idError = false;
      btActivation = false;
    } else {
      _idError = true;
    }
    notifyListeners();
  }

  void validatePwInput(String value) {
    if (value.length >= 6 && value.length <= 20) {
      _pwError = false;
      btActivation = false;
    } else {
      _pwError = true;
    }
    notifyListeners();
  }

  void validatePwMatch(String value) {
    if (pwController.text == value) {
      _pwMatch = false;
      btActivation = false;
    } else {
      _pwMatch = true;
    }
    notifyListeners();
  }

  void validateNickNameInput(String value) {
    if (value.length < 9) {
      _nicknameError = false;
      btActivation = false;
    } else {
      _nicknameError = true;
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

  void truebt(btActivation) {
    if (_idError && _pwError && _pwMatch && _nicknameError == false) {
      btActivation = false;
    } else {
      btActivation = true;
    }
  }

  bool validateEmail(String value) {
    final RegExp emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    _isEmailValid = emailRegExp.hasMatch(value);
    notifyListeners();
    return _isEmailValid;
  }

  Future<void> signup(UserModel userModel) async {
    try {
      // Convert UserModel to Map
      Map<String, dynamic> userMap = {
        "account": userModel.account,
        "password": userModel.password,
        "email": userModel.email,
        "nickname": userModel.nickname,
      };

      // Encode Map to JSON String
      String signupData = json.encode(userMap);

      // Make a POST request to your backend API
      final response = await http.post(
        Uri.parse("http://3.35.83.91:8080/member/sign-up"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: signupData,
      );

      print(userMap);

      // 응답 상태 확인
      if (response.statusCode == 200) {
        // 회원가입 성공 시, 필요한 경우 응답을 처리
        print('Signup successful');
      } else {
        // 회원가입 실패 시, 에러 처리
        print('Signup failed - ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      // 회원가입 과정에서 발생하는 에러 처리
      print('Signup failed: $error');
    }
  }

  //id 중복체크
  Future<void> idcheck(UserModel userModel) async {
    try {
      // Convert UserModel to Map
      Map<String, dynamic> userMap = {
        "account": userModel.account,
      };
      // Encode Map to JSON String
      String signupData = json.encode(userMap);

      // Make a POST request to your backend API
      final response = await http.post(
        Uri.parse("http://43.202.91.160:8080/member/check-duplicate-id-signUp"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: signupData,
      );

      print(userMap);

      // 응답 상태 확인
      if (response.statusCode == 200) {
        // 회원가입 성공 시, 필요한 경우 응답을 처리
        print('사용 가능한 닉네임입니다.');
      } else {
        // 회원가입 실패 시, 에러 처리
        print('이미 존재하는 닉네임 입니다. - ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      // 회원가입 과정에서 발생하는 에러 처리
      print('idcheck: $error');
    }
  }
}
