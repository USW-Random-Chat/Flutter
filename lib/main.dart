import 'package:flutter/material.dart';

void main() {
  runApp(MainLogin());
}

class MainLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginbtcolor = const Color(0xFF2D64D8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Container(
              height: 310,
              child: Flexible(
                //상단 말풍선 배경 및 멘트 공간
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image(
                            image: AssetImage('asstes/bubble.png'),
                            height: 286,
                          ),
                          Transform.translate(
                            offset: Offset(-135, 90),
                            child: Text('티키타카를 원해?',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'KCCChassam',
                                    color: Color(0xFF698AFF))),
                          ),
                          Transform.translate(
                            offset: Offset(-190, 145),
                            child: Text('수원대학교 친구들과\n자유롭게 소통해보자',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'KCCChassam')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
                //ID,PW 필드
                child: Container(
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 32),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'ID',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'PASSWORD',
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Flexible(
              child: Column(
                children: [
                  Container(
                      //로그인 버튼
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: loginbtcolor),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "로그인",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Pretendard-Light'),
                        ),
                      )),
                  Container(
                    //아이디 비번 찾기
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              '아이디 찾기',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'Pretendard-Light',
                              ),
                            )),
                        Container(
                          width: 10,
                          alignment: Alignment.center,
                          child: Text(
                            '/',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFBFBFBF),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              '비밀번호 찾기',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'Pretendard-Light',
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), //아이디 비번 찾기 밑에 공간
                  Container(
                      //계정이 없으신가요 + 밑줄 부분
                      margin: EdgeInsets.symmetric(horizontal: 34),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 98,
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )),
                          Text(
                            '계정이 없으신가요?',
                            style: TextStyle(
                                color: Color(0xFF767676),
                                fontSize: 14,
                                fontFamily: 'Pretendard-Light'),
                          ),
                          SizedBox(
                              width: 98,
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )),
                        ],
                      )),
                  Container(
                      //로그인 버튼
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black),
                      margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "로그인",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Pretendard-Light',
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
