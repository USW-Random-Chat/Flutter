import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/widgets/DrawerAppBarWidget.dart';

class TermsConditionsDrawerScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    child: DrawerAppBarWidget(
                      text: '이용약관',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
