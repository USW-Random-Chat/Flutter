import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/Login_page_changePW.dart';
import 'package:suwon/views/Login_page_searchID.dart';
import 'package:suwon/views/Main_page.dart';
import 'package:suwon/views/Signup_creen.dart';
import 'package:suwon/views/widgets/csbutton.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/login_viewmodel.dart';
import 'package:suwon/views/widgets/font.dart';

import 'Login_page_searchPW.dart';

class NewLoignMain extends StatelessWidget {
  const NewLoignMain({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(top: 63.h),
          child: Column(children: [
            Container(
              height: 268.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 32.w),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('asstes/bubble.PNG'),
              ),
            ),
            SizedBox(height: 32.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputFD(
                      //ID 입력창
                      onChanged: (value) => loginViewModel.setUserid(value),
                      hintText: 'ID'),
                  SizedBox(
                    height: 10.h,
                  ),
                  InputFD(
                      // PW 입력창
                      onChanged: (value) => loginViewModel.setUserpw(value),
                      hintText: 'PW',
                      obscureText: true),
                  SizedBox(height: 24.h),
                  CustomButton(
                      // 로그인 버튼
                      text: '로그인',
                      backgroundColor: Color(0xff2d63d8),
                      onPressed: () async {
                        bool success = await loginViewModel.login();
                        if (success) {
                          // 로그인 성공 처리
                          // 예를 들어, 다음 화면으로 이동
                        } else {
                          // 로그인 실패 처리
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchID()),
                            );
                          },
                          child: TextFont.fontRegular(
                              text: '아이디 찾기',
                              fontSize: 14.sp,
                              color: Color(0xFF232323))),
                      TextFont.fontRegular(
                          text: '/', fontSize: 16.sp, color: Color(0xFFBFBFBF)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                            );
                          },
                          child: TextFont.fontRegular(
                              text: '비밀번호 찾기',
                              fontSize: 14.sp,
                              color: Color(0xFF232323))),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 90.w,
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          )),
                      TextFont.fontRegular(
                          text: '계정이 없으신가요?',
                          fontSize: 14.sp,
                          color: Color(0xFF767676)),
                      SizedBox(
                          width: 90.w,
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomButton(
                      text: '회원가입',
                      backgroundColor: Color(0xFF111111),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()),
                        );
                      }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget InputFD({
    required ValueChanged<String> onChanged,
    required String hintText,
    bool obscureText = false,
  }) {
    return SizedBox(
      height: 55.h,
      width: double.maxFinite,
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: TextStyle(
            fontFamily: 'Pretendard-Regular',
            fontSize: 14.sp,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
