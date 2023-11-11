import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/widgets/DrawerAppBarWidget.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';

class FeedbackDrawerScreen extends StatelessWidget {
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
                      text: '피드백',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        TextField(
                          maxLength: 40,
                          maxLines: 9, // 여기에서 줄넘김 기능을 추가합니다.
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '앱 사용 시 불편한 점 또는 건의 사항이 있다면 자유롭게 작성해 주세요',
                            hintStyle: TextStyle(
                              fontFamily: 'Pretendard-Regular',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 12),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomButtonWidget(
                            text: "제출하기",
                            backgroundColor: Color(0xFF2D64D8),
                            onPressed: () {},
                            color: Color(0xFFFFFFFF))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
