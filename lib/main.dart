import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 45),
          child: Column(
          children: [
            Flexible(
              //상단 말풍선 배경 및 멘트 공간
              flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   Container(
                     height: 300,
                     width: double.maxFinite,
                     child: Stack(
                       alignment: Alignment.topRight,
                       children: [
                         Image(image:AssetImage('asstes/bubble.png'), height: 286,),
                         Transform.translate(offset: Offset(-127, 65),
                           child: Text('티키타카를 원해?', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'KCCChassam', color: Color(0xFF698AFF))),
                         ),
                         Transform.translate(offset: Offset(-190, 130),
                           child: Text('수원대학교 친구들과\n자유롭게 소통해보자', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'KCCChassam')),
                         ),
                       ],
                     ),
                   ),
                  ],
                ),
            ),
            Flexible(
              //ID,PW 필드
                child: Container(
                  height: 100,
                  child: Column(
                    children: [

                    ],
                  ),
                )
            ),
            Flexible(
              //로그인 버튼 및 ID,PW 비번 찾기
                child: Container(
                  height: 100,
                  color: Colors.green,
                )
            ),
            Flexible(
              //회원가입 버튼
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                )
            ),
          ],
        ),
        ),
      ),
    );
  }
}

