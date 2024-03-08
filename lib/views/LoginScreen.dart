// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/ChangePasswordScreen.dart';
import 'package:suwon/views/SearchIdScreen.dart';
import 'package:suwon/views/HomeScreen.dart';
import 'package:suwon/views/SignUpScreen.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/LoginVM.dart';
import 'package:suwon/views/widgets/NormalAlertDialogWidget.dart';
import 'package:suwon/views/widgets/TextFontWidget.dart';

import 'SearchPasswordScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginVM>(context);
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
                image: AssetImage('assets/bubble.PNG'),
              ),
            ),
            SizedBox(height: 32.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputFD(
                    // ID 입력창
                    onChanged: (value) => loginViewModel.setUserid(value),
                    hintText: 'ID',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InputFD(
                    // PW 입력창
                    onChanged: (value) => loginViewModel.setUserpw(value),
                    hintText: 'PW',
                    obscureText: true,
                  ),
                  SizedBox(height: 24.h),
                  CustomButtonWidget(
                      // 로그인 버튼
                      text: '로그인',
                      color: Colors.white,
                      backgroundColor: Color(0xff2d63d8),
                      onPressed: () async {
                        await loginViewModel.login();
                        // 로그인 결과에 따른 처리를 추가할 수 있음
                        print(loginViewModel.loginResult);

                        // 예제로 홈 화면으로 이동하는 부분 추가
                        if (loginViewModel.loginResult == '로그인 성공') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } else {
                          NormalAlertDialogWidget(
                                  title: '알림',
                                  message: 'ID 혹은 비밀번호가 올바르지 않습니다.',
                                  onClose: () {})
                              .show(context);
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
                                  builder: (context) => const SearchIdScreen()),
                            );
                          },
                          child: TextFontWidget.fontRegular(
                              text: '아이디 찾기',
                              fontSize: 14.sp,
                              color: Color(0xFF232323))),
                      TextFontWidget.fontRegular(
                          text: '/', fontSize: 16.sp, color: Color(0xFFBFBFBF)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPasswordScreen()),
                            );
                          },
                          child: TextFontWidget.fontRegular(
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
                      TextFontWidget.fontRegular(
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
                  CustomButtonWidget(
                      text: '회원가입',
                      color: Colors.white,
                      backgroundColor: Color(0xFF111111),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
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
