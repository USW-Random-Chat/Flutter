import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suwon/views/Main_page.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';

class MatchingLoading extends StatefulWidget {
  const MatchingLoading({Key? key}) : super(key: key);

  @override
  _MatchingLoadingState createState() => _MatchingLoadingState();
}

class _MatchingLoadingState extends State<MatchingLoading> {
  StreamController<int> dotStreamController = StreamController<int>();
  int numDots = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    dotStreamController.close();
    super.dispose();
  }

  // 애니메이션을 시작하는 함수
  void _startAnimation() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (numDots < 3) {
        numDots++;
      } else {
        numDots = 0;
      }
      dotStreamController.sink.add(numDots);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 295.h),
                padding: EdgeInsets.only(left: 100.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    KCCChassam(
                      color: Color(0xff000000),
                      text: '매칭 중',
                      fontsize: 40.sp,
                    ),
                    StreamBuilder<int>(
                      stream: dotStreamController.stream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        final dots = '.' * (snapshot.data ?? 0);
                        return KCCChassam(
                          color: Color(0xff000000),
                          text: dots,
                          fontsize: 40.sp,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              KCCChassam(
                color: Color(0xff2D64D8),
                text: '알고 계셨나요',
                fontsize: 20.sp,
              ),
              SizedBox(height: 18.h),
              KCCChassam(
                color: Color(0xff767676),
                text: '아이디어 내주세요',
                fontsize: 16.sp,
              ),
              SizedBox(height: 60.h),
              CustomButtonWidget(
                text: '매칭 중단하기',
                backgroundColor: Color(0xff111111),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                color: Color(0xffFFFFFF),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget KCCChassam({
    required Color color,
    required String text,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w400,
        fontFamily: 'KCCChassam',
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
