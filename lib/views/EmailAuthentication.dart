import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/models/user_model.dart';
import 'package:suwon/viewmodels/SignupVM.dart';
import 'package:provider/provider.dart';
import 'package:suwon/views/LoginScreen.dart';
import 'package:suwon/views/SignUpScreen.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';
import 'package:suwon/views/widgets/EmailTextFieldWidget.dart';
import 'package:suwon/views/widgets/SuchatAppBarWidget.dart';
import 'package:suwon/views/widgets/TextFontWidget.dart';

class EmailAuth extends StatelessWidget {
  const EmailAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupVM>(context);
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            margin: EdgeInsets.only(top: 88.h),
            child: Form(
              child: Column(
                children: [
                  Container(
                    //상단바
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SuchatAppBarWidget(
                      text: ' 회원가입',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 35.h),
                            EmailTextFieldWidget(
                                controller: signupViewModel.emailController,
                                onChanged: (value) =>
                                    signupViewModel.isEmailValid),
                            SizedBox(height: 57.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFontWidget.fontSemiBold(
                                  text: '* 입력하신 메일로 ',
                                  fontSize: 12.sp,
                                  color: Color(0xFF989898),
                                ),
                                TextFontWidget.fontSemiBold(
                                  text: '이메일 인증 URL ',
                                  fontSize: 12.sp,
                                  color: Color(0xff2d63d8),
                                ),
                                TextFontWidget.fontSemiBold(
                                  text: '을 전송합니다',
                                  fontSize: 12.sp,
                                  color: Color(0xFF989898),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            CustomButtonWidget(
                              text: '인증메일 전송',
                              color: Colors.white,
                              backgroundColor: Color(0xff2d63d8),
                              onPressed: () async {
                                // 사용자 입력을 JSON 형식으로 변환합니다
                                String jsonData = json.encode({
                                  "memberId": signupViewModel.idController.text,
                                  "password": signupViewModel.pwController.text,
                                  "email": signupViewModel.emailController.text,
                                  "nickname":
                                      signupViewModel.nicknameController.text,
                                });

                                // UserModel.fromJson 생성자를 사용하여 UserModel 객체를 만듭니다
                                UserModel userModel =
                                    UserModel.fromJson(json.decode(jsonData));

                                // UserModel 객체와 함께 signup 메서드를 호출합니다
                                await signupViewModel.signup(userModel);
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomButtonWidget(
                                text: '회원가입 완료',
                                color: Colors.white,
                                backgroundColor: Color(0xFF111111),
                                onPressed: () {
                                  signupViewModel.idController.clear();
                                  signupViewModel.pwController.clear();
                                  signupViewModel.pwMatchController.clear();
                                  signupViewModel.emailController.clear();
                                  signupViewModel.nicknameController.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
