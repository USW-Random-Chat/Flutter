import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/AccountRecovery_viewmodel.dart';
import 'package:suwon/views/login_screen.dart';
import 'package:suwon/views/widgets/SuchatAppBarWidget.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';
import 'package:suwon/views/widgets/EmailTextFieldWidget.dart';
import 'package:suwon/views/widgets/IdTextFieldWidget.dart';

class SearchPW extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SearchPW({super.key});

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
                          text: '비밀번호 찾기',
                          onPressed: () {
                            accountRecoveryViewModel.idController.clear();
                            accountRecoveryViewModel.emailController.clear();
                            accountRecoveryViewModel.ValidationCodeController
                                .clear();
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 42.h,
                            ),
                            IdTextFieldWidget(
                                controller:
                                    accountRecoveryViewModel.idController,
                                onChanged: (value) => accountRecoveryViewModel
                                    .idError), //ID_field 수정 필요
                            SizedBox(
                              height: 21.h,
                            ),
                            EmailTextFieldWidget(
                                controller:
                                    accountRecoveryViewModel.emailController,
                                onChanged: (value) =>
                                    accountRecoveryViewModel.isEmailValid),
                            SizedBox(
                              height: 60.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '* 입력하신 메일로 ',
                                  style: TextStyle(
                                    color: Color(0xff989898),
                                    fontFamily: 'Pretendard',
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                Text(
                                  '인증코드',
                                  style: TextStyle(
                                    color: Color(0xff2D64D8),
                                    fontFamily: 'Pretendard',
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                Text(
                                  '를 전송합니다',
                                  style: TextStyle(
                                    color: Color(0xff989898),
                                    fontFamily: 'Pretendard',
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            CustomButtonWidget(
                              text: '인증코드 전송',
                              color: Colors.white,
                              backgroundColor: Color(0xff2D64D8),
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            InputCode(
                                onChanged: (value) =>
                                    accountRecoveryViewModel.isEmailValid,
                                hintText: '인증코드 4자리 입력'), //onChanged 변경 필요
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget InputCode(
      {required ValueChanged<String> onChanged,
      required String hintText,
      bool obscureText = false}) {
    return SizedBox(
      height: 55.h,
      width: double.maxFinite,
      child: TextFormField(
        //controller: , 추 후
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14.sp,
            ),
            hintText: hintText,
            suffix: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2D64D8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.sp)),
                  fixedSize: Size(70.sp, 38.sp)),
              onPressed: () {},
              child: Text(
                '확인',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pretendard',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.35.sp,
                ),
              ),
            )),
      ),
    );
  }
}
