import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suwon/views/HomeScreen.dart';

class RandomChat extends StatefulWidget {
  const RandomChat({Key? key});

  @override
  State<RandomChat> createState() => _RandomChatState();
}

class _RandomChatState extends State<RandomChat> {
  bool isChatEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: 812.h,
          child: Column(
            children: [
              header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Add your chat messages here
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                height: 58.h,
                child: CustomTextField(
                  hintText: '채팅을 시작해 보세요 . . .',
                  onIconTap: (isEnabled) {
                    setState(() {
                      isChatEnabled = isEnabled;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      height: 128.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(right: 32.w, left: 32.w, bottom: 14.h),
      color: Color(0xff4D76C8),
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/User.svg',
                  width: 32.w,
                  height: 32.h,
                ),
                SizedBox(width: 12.w),
                Text(
                  'nickname',
                  style: TextStyle(
                    fontFamily: 'KCCChassam',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 95.w),
          GestureDetector(
            onTap: isChatEnabled
                ? null
                : () {
                    onPressed();
                  },
            child: SvgPicture.asset(
              'assets/Report button.svg',
              width: 40.w,
              height: 40.h,
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: SvgPicture.asset(
              'assets/Exit.svg',
              width: 38.w,
              height: 38.h,
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    // 버튼이 클릭되었을 때의 동작을 정의합니다.
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Function(bool) onIconTap;

  CustomTextField({required this.hintText, required this.onIconTap});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isInputEmpty = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        setState(() {
          isInputEmpty = text.isEmpty;
        });
        widget.onIconTap(isInputEmpty);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xff737373),
          fontFamily: 'Pretendard-Regular',
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.only(left: 17.w, top: 12, bottom: 12),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isInputEmpty = !isInputEmpty;
            });
            widget.onIconTap(isInputEmpty);
          },
          child: SvgPicture.asset(
            isInputEmpty ? 'assets/offchatbt.svg' : 'assets/onchatbt.svg',
            width: 40.w,
            height: 40.h,
          ),
        ),
      ),
    );
  }
}
