import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/EmailAuthentication.dart';
import 'package:suwon/views/LoginScreen.dart';
import 'package:suwon/views/SignUpDoneScreen.dart';
import 'package:suwon/views/widgets/SuchatAppBarWidget.dart';
import 'package:suwon/viewmodels/SignupVM.dart';
import 'package:provider/provider.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';
import 'package:suwon/views/widgets/EmailTextFieldWidget.dart';
import 'package:suwon/views/widgets/TextFontWidget.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

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
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    //상단바
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SuchatAppBarWidget(
                      text: ' 회원가입',
                      onPressed: () {
                        signupViewModel.idController.clear();
                        signupViewModel.pwController.clear();
                        signupViewModel.pwMatchController.clear();
                        signupViewModel.emailController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
                            SizedBox(height: 40.h),
                            IdInputFD(
                              labelText: '아이디',
                              hintText: '아이디 입력 (4~16자)',
                              controller: signupViewModel.idController,
                              showErrorText: signupViewModel.idError,
                              errorText: '* 4자 이상 16자 이내로 작성해 주세요',
                              onChanged: (value) =>
                                  signupViewModel.validateIdInput(value),
                              onPressed: () {},
                            ),
                            SizedBox(height: 40.h),
                            IdInputFD(
                              labelText: '닉네임',
                              hintText: '닉네임 입력',
                              controller: signupViewModel.nicknameController,
                              showErrorText: signupViewModel.nicknameError,
                              errorText: '8자 이내로 작성해 주세요',
                              onChanged: (value) =>
                                  signupViewModel.validateNickNameInput(value),
                              onPressed: () {},
                            ),
                            SizedBox(height: 40.h),
                            PwInputFD(
                              labelText: '비밀번호',
                              showErrorText: signupViewModel.pwError,
                              errorText: '* 6자 이상 20자 이내로 작성해 주세요',
                              obscureText: signupViewModel.passwordVisible1,
                              controller: signupViewModel.pwController,
                              onChanged: (value) =>
                                  signupViewModel.validatePwInput(value),
                              hintText: '비밀번호 입력 (문자, 숫자 포함 6~20자)',
                              onPressed: () {
                                signupViewModel.togglePasswordVisibility1();
                              },
                              icon: signupViewModel.passwordVisible1
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            SizedBox(height: 18.h),
                            PwInputFD(
                              labelText: '비밀번호 확인',
                              showErrorText: signupViewModel.pwMatch,
                              errorText: '* 비밀번호가 일치하지 않습니다.',
                              obscureText: signupViewModel.passwordVisible2,
                              controller: signupViewModel.pwMatchController,
                              onChanged: (value) =>
                                  signupViewModel.validatePwMatch(value),
                              hintText: '비밀번호 입력 (문자, 숫자 포함 6~20자)',
                              onPressed: () {
                                signupViewModel.togglePasswordVisibility2();
                              },
                              icon: signupViewModel.passwordVisible2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            SizedBox(height: 60.h),
                            CustomButtonWidget(
                                text: '다음',
                                color: Colors.white,
                                backgroundColor: signupViewModel.btActivation
                                    ? Colors.grey
                                    : Color(0xFF111111),
                                onPressed: () async {}),

                            /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EmailAuth()),
                                  );*/
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFontWidget.fontSemiBold(
                                  text: '회원가입 시 ',
                                  fontSize: 12.sp,
                                  color: Color(0xFF989898),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // 버튼이 클릭되었을 때 실행될 코드
                                  },
                                  child: TextFontWidget.fontSemiBold(
                                    text: '서비스 이용약관',
                                    fontSize: 12.sp,
                                    color: Color(0xFF2D64D8),
                                  ),
                                ),
                                TextFontWidget.fontSemiBold(
                                  text: ' 및 ',
                                  fontSize: 12.sp,
                                  color: Color(0xFF989898),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // 버튼이 클릭되었을 때 실행될 코드
                                  },
                                  child: TextFontWidget.fontSemiBold(
                                    text: '개인정보 처리방침',
                                    fontSize: 12.sp,
                                    color: Color(0xFF2D64D8),
                                  ),
                                ),
                              ],
                            ),
                            TextFontWidget.fontSemiBold(
                              text: '하신 것으로 간주됩니다',
                              fontSize: 12.sp,
                              color: Color(0xFF989898),
                            ),
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

class IdInputFD extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool showErrorText;
  final String errorText;
  final VoidCallback? onPressed;

  IdInputFD({
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.showErrorText,
    required this.errorText,
    this.onPressed,
  });

  // 에러 메시지 위젯
  Widget errorTextWidget() {
    if (showErrorText) {
      return Text(
        errorText,
        style: TextStyle(color: Colors.red),
      );
    } else {
      return Container(); // 에러가 없으면 빈 컨테이너 반환
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 8.w),
            Text(
              labelText,
              style: TextStyle(
                fontFamily: 'Pretendard-Regular',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            errorTextWidget(), // 에러 메시지 위젯 추가
          ],
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(
                fontFamily: 'Pretendard-Light',
                fontSize: 14.sp,
              ),
              hintText: hintText,
              contentPadding:
                  EdgeInsets.only(top: 10, bottom: 17, left: 10, right: 10),
              suffix: Container(
                width: 100.w,
                height: 38.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF2D64D8),
                ),
                child: TextButton(
                  onPressed: onPressed ?? () {}, // onPressed가 null이 아닐 때만 사용
                  child: TextFontWidget.fontRegular(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    text: '중복 확인',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PwInputFD extends StatelessWidget {
  final String labelText; // Text 위젯의 텍스트
  final bool showErrorText; // 에러 메시지를 보여줄지 여부
  final String errorText; // 에러 테스트
  final bool obscureText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final VoidCallback? onPressed;
  final IconData icon;

  PwInputFD({
    required this.labelText,
    required this.showErrorText,
    required this.errorText,
    required this.obscureText,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 8.w),
              Text(
                labelText,
                style: TextStyle(
                  fontFamily: 'Pretendard-Regular',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              if (showErrorText)
                Text(
                  errorText,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              obscureText: obscureText,
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hintText,
                contentPadding:
                    EdgeInsets.only(top: 10, bottom: 17, left: 10, right: 10),
                suffixIcon: IconButton(
                  icon: Icon(icon),
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
