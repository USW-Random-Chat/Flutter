/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/viewmodels/SignupVM.dart';
import 'package:provider/provider.dart';

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
                            IdInputFD(),
                            SizedBox(height: 44.h),
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
                            SizedBox(height: 46.h),
                            EmailTextFieldWidget(
                                controller: signupViewModel.emailController,
                                onChanged: (value) =>
                                    signupViewModel.isEmailValid),
                            SizedBox(height: 57.h),
                            CustomButtonWidget(
                                text: '다음',
                                color: Colors.white,
                                backgroundColor: Color(0xFF111111),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpDoneScreen()),
                                  );
                                }),
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
*/