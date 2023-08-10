import 'package:flutter/material.dart';
import 'package:suwon/screens/login.dart';
import 'package:suwon/widgets/csbutton.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwmatchController = TextEditingController();
  bool _IdError = false;
  bool _PwError = false;
  bool _EmailError = false;
  bool _PwMatch = false;
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
  final IdCheckbtcolor = const Color(0xFF2D64D8);

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // 회원가입 로직을 여기에 구현하면 됩니다.
      // 예: API 호출, 데이터 저장 등
      String id = _idController.text;
      String password = _pwController.text;
      String email = _emailController.text;
      String pwmatch = _pwmatchController.text;

      print('id: $id');
      print('Password: $password');
      print('email: $email');
      print('pw: $pwmatch');
    }
  }

  // id 4자 이상 16자 이하
  void _valiIdInput(String value) {
    if (value.length >= 4 && value.length <= 16) {
      setState(() {
        _IdError = false;
      });
    } else {
      setState(() {
        _IdError = true;
      });
    }
  }

  //pw 6자 이상 20자 이하
  void _valiPwInput(String value) {
    if (value.length >= 6 && value.length <= 20) {
      setState(() {
        _PwError = false;
      });
    } else {
      setState(() {
        _PwError = true;
      });
    }
  }

  void _valiPwMatch(String value) {
    // ignore: unrelated_type_equality_checks
    if (_pwController.text != value) {
      setState(() {
        _PwMatch = false;
      });
    } else {
      setState(() {
        _PwMatch = true;
      });
    }
  }

  bool _isEmailValid = true;
  bool _validateEmail(String value) {
    // 이메일 유효성 검사를 위한 정규표현식 사용
    final RegExp emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            margin: EdgeInsets.only(left: 33, right: 33, top: 70),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    //상단 회원가입+뒤로가기 버튼
                    width: double.maxFinite,
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainLogin()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              size: 28,
                            )),
                        SizedBox(
                          width: 102,
                        ),
                        Text(
                          '회원가입',
                          style: TextStyle(
                              fontFamily: 'Pretendard-Light',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 38,
                        ),
                        Row(
                          //ID 입력폼
                          children: [
                            Text(
                              '  아이디',
                              style: TextStyle(
                                  fontFamily: 'Pretendard-Light',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            if (_IdError)
                              Text(
                                '*4자 이상 16자 이내로 작성해 주세요',
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 58,
                          child: TextFormField(
                            controller: _idController,
                            onChanged: _valiIdInput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelStyle: TextStyle(
                                  fontFamily: 'Pretendard-Light', fontSize: 14),
                              hintText: '아이디 입력 (4~16자)',
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(248, -51),
                          child: Container(
                            height: 44,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: IdCheckbtcolor,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '중복확인',
                                style: TextStyle(
                                    fontFamily: 'Pretendard-Light',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          //PW 입력폼
                          children: [
                            Text(
                              '  비밀번호',
                              style: TextStyle(
                                  fontFamily: 'Pretendard-Light',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            if (_PwError)
                              Text(
                                '* 6자 이상 20자 이내로 작성해 주세요',
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 58,
                          child: TextFormField(
                            obscureText: !_passwordVisible1,
                            controller: _pwController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Pretendard-Light',
                                fontSize: 14,
                              ),
                              hintText: '비밀번호 입력 (문자, 숫자 포함 6~20자)',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible1 = !_passwordVisible1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          //PW 입력폼
                          children: [
                            Text(
                              '  비밀번호 확인',
                              style: TextStyle(
                                  fontFamily: 'Pretendard-Light',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            if (_pwController.text != _pwmatchController.text)
                              Text(
                                '* 비밀번호가 일치하지 않습니다.',
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 58,
                          child: TextFormField(
                            obscureText: !_passwordVisible2,
                            controller: _pwmatchController,
                            onChanged: _valiPwMatch,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Pretendard-Light',
                                fontSize: 14,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible2 = !_passwordVisible2;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Transform.translate(
                          offset: Offset(225, 33),
                          child: Text(
                            "@ suwon.ac.kr",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Color(0xFFBFBFBF),
                              ),
                            ),
                          ),
                          child: TextFormField(
                            maxLength: 20,
                            controller: _emailController,
                            onChanged: (value) {
                              setState(() {
                                _isEmailValid = _validateEmail(value);
                              });
                            },
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: 'Pretendard-Light',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF989898),
                              ),
                              hintText: '  포털 이메일 입력',
                              counterText:
                                  '', // 입력 길이 카운터 텍스트를 빈 문자열로 설정하여 표시하지 않음
                              errorStyle:
                                  TextStyle(height: 0), // 에러 메시지 표시 공간을 없앰
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        if (!_isEmailValid)
                          Text(
                            '* 이메일 형식이 올바르지 않습니다',
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(
                          height: 45,
                        ),
                        CustomButton(
                            text: '회원가입',
                            backgroundColor: Colors.black,
                            onPressed: () {}),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                '회원가입 시 서비스 이용약관 및 개인정보 처리방침에 동의',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Pretendard-Light',
                                    fontSize: 13),
                              ),
                              Text(
                                '하신 것으로 간주됩니다',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Pretendard-Light',
                                    fontSize: 13),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
