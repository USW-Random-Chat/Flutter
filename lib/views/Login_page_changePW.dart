import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/AccountRecovery_viewmodel.dart';

import 'package:suwon/views/login_screen.dart';

import 'package:suwon/views/widgets/SuchatAppBarWidget.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';

class ChangePW extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final accountRecoveryViewModel =
        Provider.of<AccountRecoveryViewModel>(context);

    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(top: 70.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SuchatAppBarWidget(
                    text: '비밀번호 변경',
                    onPressed: () {
                      accountRecoveryViewModel.pwController.clear();
                      accountRecoveryViewModel.pwMatchController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewLoignMain()),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 54.h),
                            Change_PwInputFD(
                              labelText: '비밀번호',
                              showErrorText: accountRecoveryViewModel.pwError,
                              errorText: '* 6자 이상 20자 이내로 작성해 주세요',
                              obscureText:
                                  accountRecoveryViewModel.passwordVisible1,
                              controller: accountRecoveryViewModel.pwController,
                              onChanged: (value) => accountRecoveryViewModel
                                  .validatePwInput(value),
                              hintText: '새 비밀번호 입력 (문자, 숫자 포함 6~20자)',
                              onPressed: () {
                                accountRecoveryViewModel
                                    .togglePasswordVisibility1();
                              },
                              icon: accountRecoveryViewModel.passwordVisible1
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Change_PwInputFD(
                              labelText: '비밀번호 확인',
                              showErrorText: accountRecoveryViewModel.pwMatch,
                              errorText: '* 비밀번호가 일치하지 않습니다.',
                              obscureText:
                                  accountRecoveryViewModel.passwordVisible2,
                              controller:
                                  accountRecoveryViewModel.pwMatchController,
                              onChanged: (value) => accountRecoveryViewModel
                                  .validatePwInput(value),
                              hintText: '비밀번호 입력 (문자, 숫자 포함 6~20자)',
                              onPressed: () {
                                accountRecoveryViewModel
                                    .togglePasswordVisibility2();
                              },
                              icon: accountRecoveryViewModel.passwordVisible2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            SizedBox(height: 48.h),
                            CustomButtonWidget(
                                text: '변경 완료',
                                color: Colors.white,
                                backgroundColor: Color(0xff2D64D8),
                                onPressed: () {})
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Change_PwInputFD extends StatelessWidget {
  final String labelText; // Text 위젯의 텍스트
  final bool showErrorText; // 에러 메시지를 보여줄지 여부
  final String errorText; // 에러 테스트
  final bool obscureText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final VoidCallback? onPressed;
  final IconData icon;

  Change_PwInputFD({
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
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                ),
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
