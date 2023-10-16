import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/widgets/NormalAlertDialogWidget.dart';
import 'package:suwon/views/widgets/csbutton.dart';
import 'package:suwon/views/login_screen.dart';

class SignUpDone extends StatefulWidget {
  const SignUpDone({super.key});

  @override
  _SignUpDoneState createState() => _SignUpDoneState();
}

class _SignUpDoneState extends State<SignUpDone> {
  bool showCheck = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        showCheck = true; // 화면이 그려진 후에 애니메이션 시작
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 224.h, left: 32.w, right: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: '포털 메일로 ',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xFF111111),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Pretendard-Regular',
                              )),
                          TextSpan(
                              text: '가입 승인 링크',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xFF2D64D8),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Pretendard-Regular',
                              )),
                          TextSpan(
                              text: '를',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xFF111111),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Pretendard-Regular',
                              )),
                        ]),
                      ),
                      Text('발송했습니다',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Color(0xFF111111),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Pretendard-Regular',
                          )),
                      SizedBox(
                        height: 172.h,
                        child: showCheck ? AnimatedCheckCircle() : SizedBox(),
                      ),
                      Text('발송 된 링크 클릭 후 로그인 해주세요',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Color(0xFF111111),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Pretendard-Regular',
                          )),
                      SizedBox(height: 126.h),
                    ],
                  ),
                ],
              ),
              CustomButton(
                text: '로그인',
                color: Colors.black,
                border: Border.all(width: 1, color: Color(0xFF2D64D8)),
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewLoignMain(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomButton(
                text: '메일 재발송',
                backgroundColor: Color(0xFF111111),
                onPressed: () {
                  NormalAlertDialogWidget(
                    title: "알림",
                    message: "포털 메일이 재발송되었습니다.",
                    onClose: () {
                      // 다이얼로그 닫기 후 뒤로 화면이동
                      //Navigator.of(context).pop();
                    },
                  ).show(context);
                },
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedCheckCircle extends StatefulWidget {
  @override
  _AnimatedCheckCircleState createState() => _AnimatedCheckCircleState();
}

class _AnimatedCheckCircleState extends State<AnimatedCheckCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    // 애니메이션 컨트롤러 초기화
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1600), // 전체 애니메이션 지속 시간 설정 (1초)
    );

    // 체크 아이콘 애니메이션 설정 (투명도 변화: 0.0 -> 1.0)
    _checkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut), // 전체 1초 동안 실행
      ),
    );

    // 애니메이션 시작
    _controller.forward();
  }

  @override
  void dispose() {
    // 애니메이션 컨트롤러 해제
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w, // 원래 크기
        height: 100.h, // 원래 크기
        decoration: BoxDecoration(
          color: Color(0xFF2D64D8), // 파란색 원
          shape: BoxShape.circle,
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _checkAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _checkAnimation.value, // 체크 아이콘의 투명도를 조절
                child: child,
              );
            },
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 60.w,
            ),
          ),
        ),
      ),
    );
  }
}
