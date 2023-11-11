import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/HomeScreen.dart';
import 'package:suwon/views/SignUpScreen.dart';
import 'package:suwon/views/widgets/SuchatAppBarWidget.dart';
import 'package:suwon/viewmodels/SignupVM.dart';
import 'package:provider/provider.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';
import 'package:suwon/views/widgets/TextFontWidget.dart';

class EditProfileDrawerScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      text: ' 프로필 설정',
                      onPressed: () {
                        signupViewModel.idController.clear();
                        signupViewModel.pwController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
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
                            InputFD(
                              labelText: '닉네임',
                              text: ' (필수)',
                              color: Color(0xFFFF0000),
                              controller: signupViewModel.nicknameController,
                              onChanged: (value) =>
                                  signupViewModel.validateNickName(value),
                              showErrorText: signupViewModel.nicknameError,
                              errorText: '* 닉네임은 8자 이내로 작성 해주세요',
                              hintText: '# NICKNAME',
                              height: 50.h,
                              suffix: Container(
                                width: 100.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFF2D64D8),
                                ),
                                child: TextButton(
                                    onPressed: () {},
                                    child: TextFontWidget.fontRegular(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 14,
                                        text: '중복 확인')),
                              ),
                            ),
                            SizedBox(height: 25.h),
                            InputFD(
                                labelText: 'MBTI',
                                text: ' (선택)',
                                color: Color(0xFF767676),
                                controller: signupViewModel.mbtiController,
                                max: 4,
                                hintText: '# MBTI',
                                height: 50.h),
                            SizedBox(height: 12.h),
                            Self(controller: signupViewModel.selfController),
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

class InputFD extends StatelessWidget {
  final String labelText; // Text 위젯의 텍스트
  final String text;
  final Color color;
  final bool showErrorText; // 에러 메시지를 보여줄지 여부
  final String? errorText; // 에러 테스트 (선택적으로 입력 받도록 변경)
  final TextEditingController controller;
  final Function(String)? onChanged;
  final int? max; //최대 입력 글자수
  final String hintText;
  final double height;
  final Widget? suffix;
  // 높이를 입력받는 새로운 매개변수

  InputFD({
    required this.labelText,
    required this.text,
    required this.color,
    this.showErrorText = false, // showErrorText의 기본값을 false로 설정
    this.errorText, // errorText를 선택적으로 입력 받도록 변경
    required this.controller,
    this.onChanged,
    this.max,
    required this.hintText,
    required this.height,
    this.suffix,
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
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontFamily: 'Pretendard-Regular',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: height, // 높이를 입력 매개변수로 설정
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              maxLength: max,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hintText,
                contentPadding:
                    EdgeInsets.only(top: 10, bottom: 17, left: 10, right: 10),
                counterText: '',
                suffix: suffix,
              ),
            ),
          ),
          Row(
            children: [
              if (showErrorText && errorText != null)
                Text(
                  errorText!,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class Self extends StatelessWidget {
  final TextEditingController controller;

  Self({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 8.w),
            Text(
              '자기소개',
              style: TextStyle(
                fontFamily: 'Pretendard-Regular',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              ' (선택)',
              style: TextStyle(
                fontFamily: 'Pretendard-Regular',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF767676),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          maxLength: 40,
          maxLines: 3, // 여기에서 줄넘김 기능을 추가합니다.
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: '학과, 학번 등 소개를 자유롭게 입력하세요 (40자 이내)',
            hintStyle: TextStyle(
              fontFamily: 'Pretendard-Regular',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            counterText: '',
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          ),
        ),
      ],
    );
  }
}
