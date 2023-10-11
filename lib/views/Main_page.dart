import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suwon/views/widgets/cancel_and_action_alert_dialog.dart';
import 'package:suwon/views/edit_profie.dart';
import 'package:suwon/views/login_screen.dart';
import 'package:suwon/views/matching_loding.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context, child) => Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 80.h,
            centerTitle: false,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Colors.white,
            title:
            Container(
              width: 96.w,
              height: 80.h,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Row(
                children: [
                  SizedBox(width: 15.w,),
                  Image.asset('asstes/SUCHAT.png', width: 76.w, height: 20.h, )
                ],
              ),
            ),
            actions: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: IconButton(icon: SvgPicture.asset('asstes/onclikmenu.svg', width: 28.w,
                          height: 20.h), onPressed: (){},)
                    ),
                    SizedBox(width: 25.w,),
                  ],
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                child: Text(
                  '_배너',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                alignment: Alignment.center,
                height: 55.h,
                width: 390.w,
                color: Color(0xffDBDBDB),
              ),
              Row(
                children: [
                  SizedBox(width: 32.w,),
                  Container(
                    height: 335.h,
                    width: 358.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Transform.scale(
                      scale: 1,
                      child: Transform.translate(
                        offset: const Offset(0, -60),
                        child: ClipRect(
                          child: Image.asset(
                            'asstes/bubble_main.PNG',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: CustomButton_main(
                  text: '매칭 시작하기',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MatchingLoading()
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
                width: 360.w,
              ),
              Container(
                child: Text(
                  '주의!! 욕설 및 상대방에게 불쾌함을 주는 채팅\n         적발 시 계정 이용이 제한됩니다   ',
                  style: TextStyle(
                    color: Color(0xff767676),
                    fontFamily: 'KCCChassam',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                width: 390.w,
              ),
              Container(
                height: 20.h,
                width: 390.w,
                child: Text(
                  '@copyright by Flag',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff767676),
                    fontFamily: 'Pretendard',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

class CustomButton_main extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton_main({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 334.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: Color(0xff2D64D8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'KCCChassam',
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}