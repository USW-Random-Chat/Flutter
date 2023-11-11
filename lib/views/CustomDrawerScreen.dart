import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suwon/views/EditProfileDrawerScreen.dart';
import 'package:suwon/views/TermsConditionsDrawerScreen.dart';
import 'package:suwon/views/FeedbackDrawerScreen.dart';
import 'package:suwon/views/LoginScreen.dart';
import 'package:suwon/views/widgets/CancelAndActionAlertDialogWidget.dart';

class CustomDrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.sp,
              padding: EdgeInsets.only(right: 20.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // 가로 방향에서 맨 오른쪽 정렬
                children: [
                  SizedBox(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset(
                      'assets/close.png',
                      scale: 4.sp,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.zero, // 상단 여백 제거
                    padding: EdgeInsets.only(left: 40.sp),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/Group.png'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'AnSungMin',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'KCCChassam',
                            fontSize: 22,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '# ISTP',
                          style: TextStyle(
                            color: Color(0xff767676),
                            fontFamily: 'KCCChassam',
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xFFEDEDED),
              thickness: 1.0,
            ),
            SizedBox(height: 20),
            ListTile_main(
              text: '프로필 수정',
              Menu_Icon: 'assets/profile.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileDrawerScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ListTile_main(
              text: '이용약관',
              Menu_Icon: 'assets/policy.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsConditionsDrawerScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ListTile_main(
              text: ' 피드백',
              Menu_Icon: 'assets/feedback.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackDrawerScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ListTile_main(
                text: '로그아웃',
                Menu_Icon: 'assets/logout.svg',
                onTap: () {
                  CancelAndActionAlertDialogWidget(
                          title: "로그아웃 하시겠습니까?",
                          action: "로그아웃",
                          onAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          onCancel: () {})
                      .show(context);
                }),
          ],
        ),
      ),
    );
  }
}

class ListTile_main extends StatelessWidget {
  final String text;
  final String Menu_Icon;
  final VoidCallback onTap;

  const ListTile_main(
      {required this.text, required this.Menu_Icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 20.sp,
            ),
            SvgPicture.asset(Menu_Icon),
            SizedBox(width: 10.sp),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Pretendard',
                fontSize: 16.sp,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.4.sp,
              ),
            ), // 제목
            SizedBox(width: 20.sp),
            Image.asset(
              'assets/Vector6.png',
              scale: 4.sp,
            )
          ],
        ),
        onTap: onTap);
  }
}
