import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/viewmodels/AccountRecovery_viewmodel.dart';
import 'package:suwon/viewmodels/signup_viewmodel.dart';
import 'package:suwon/views/login_screen.dart';
import 'package:suwon/views/widgets/appbar.dart';
import 'package:suwon/views/widgets/csbutton.dart';
import 'package:suwon/views/widgets/emailfield.dart';
import 'package:provider/provider.dart';

class SearchID extends StatelessWidget {
  const SearchID({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  //상단바
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SuchatAppBar(
                    text: '아이디 찾기',
                    onPressed: () {
                      accountRecoveryViewModel.emailController.clear();
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
                            SizedBox(
                              height: 42.h,
                            ),
                            EmailFD(
                                controller:
                                    accountRecoveryViewModel.emailController,
                                onChanged: (value) =>
                                    accountRecoveryViewModel.isEmailValid),
                            SizedBox(height: 60.h),
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
                                  '가입된 아이디 ',
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
                                  '정보를 전송합니다',
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
                            CustomButton(
                              text: '확인메일 전송',
                              color: Colors.white,
                              backgroundColor: Color(0xff2D64D8),
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            CustomButton(
                              text: '로그인 하러가기',
                              color: Colors.white,
                              backgroundColor: Color(0xff111111),
                              onPressed: () {},
                            ),
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
