import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/AccountSearchVM.dart';
import 'package:suwon/views/LoginScreen.dart';
import 'package:suwon/views/SignUpScreen.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';
import 'package:suwon/views/widgets/EmailTextFieldWidget.dart';
import 'package:suwon/views/widgets/SuchatAppBarWidget.dart';
import 'package:suwon/views/widgets/TextFontWidget.dart';

class IdSearchScreen extends StatelessWidget {
  const IdSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountSearchViewModel = Provider.of<AccountSearchVM>(context);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SuchatAppBarWidget(
                    text: '아이디 찾기',
                    onPressed: () {
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
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 35.h),
                            EmailTextFieldWidget(
                              controller:
                                  accountSearchViewModel.emailController,
                              onChanged: (value) {},
                            ),
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
                                  text: '가입된 아이디 ',
                                  fontSize: 12.sp,
                                  color: Color(0xff2d63d8),
                                ),
                                TextFontWidget.fontSemiBold(
                                  text: '정보를 전송합니다',
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
                                await accountSearchViewModel.sendIDEmail();
                                if (accountSearchViewModel.emailSent) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('인증 메일이 전송되었습니다.'),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('이메일 전송에 실패했습니다. 다시 시도해주세요.'),
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 15.h),
                            CustomButtonWidget(
                              text: '로그인 하러가기',
                              color: Colors.white,
                              backgroundColor: Color(0xFF111111),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
