import 'package:flutter/material.dart';
import 'package:suwon/screens/signup.dart';

class SetProfile extends StatefulWidget {
  const SetProfile({super.key});

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _mbtiController = TextEditingController();
  TextEditingController _introduceController = TextEditingController();
  final NickCheckbtcolor = const Color(0xFF2D64D8);

  bool _NickError = false;
  void _valiNickInput(String value) {
    if (value.length <= 8) {
      setState(() {
        _NickError = false;
      });
    } else {
      setState(() {
        _NickError = true;
      });
    }
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
                                    builder: (context) => const SignUp()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              size: 28,
                            )),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          '프로필 설정',
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
                            '  닉네임',
                            style: TextStyle(
                                fontFamily: 'Pretendard-Light',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(필수)',
                            style: TextStyle(
                              fontFamily: 'Pretendard-Light',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 58,
                        child: TextFormField(
                          controller: _nicknameController,
                          onChanged: _valiNickInput,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: TextStyle(
                                fontFamily: 'Pretendard-Light', fontSize: 14),
                            hintText: '# NICKNAME',
                          ),
                        ),
                      ),
                      if (_NickError)
                        Text(
                          '  * 닉네임은 8자 이내로 작성 해주세요',
                          style: TextStyle(color: Colors.red),
                        ),
                      Transform.translate(
                        offset: Offset(248, -51),
                        child: Container(
                          height: 44,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: NickCheckbtcolor,
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
                        height: 15,
                      ),
                      Row(
                        //MBTI 입력폼
                        children: [
                          Text(
                            '  MBTI',
                            style: TextStyle(
                                fontFamily: 'Pretendard-Light',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(선택)',
                            style: TextStyle(
                              fontFamily: 'Pretendard-Light',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF767676),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 58,
                        child: TextFormField(
                          controller: _mbtiController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: TextStyle(
                                fontFamily: 'Pretendard-Light', fontSize: 14),
                            hintText: '# MBTI',
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              )),
        ),
      ),
    );
  }
}
