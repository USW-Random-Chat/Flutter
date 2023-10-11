import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asstes/SUCHAT.png',
                      width: 74.w,
                      height: 20.h,
                      fit: BoxFit.fill,
                    )
                  ],
                )
              ],
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: SvgPicture.asset(
                            'asstes/Icon_menu.svg',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 28.w,
                  )
                ],
              ),
            )
          ],
        ),
        endDrawer:
        Container(
          child:
          Drawer(
              backgroundColor: Colors.white,
              width: 240.w,
              child: Container(
                width: 240.w,
                child:
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DrawerHeader(
                            margin: EdgeInsets.zero,
                            child: Container(
                              height: 291.h,
                              child: Column(
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(onPressed: (){}, icon: Image.asset('asstes/close.png', height: 16.h, width: 16.h,))
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),

                        Container(
                          height: 402.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xffEDEDED),
                                  width: 1.w),
                              bottom: BorderSide(
                                color: Color(0xffEDEDED),
                                width: 1.w,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 397.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListTile_main(
                                      text: '프로필 수정',
                                      Menu_Icon: 'asstes/profile.svg',
                                      onTap: ()
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditProfile(),
                                          ),
                                        );
                                      }, ),
                                    ListTile_main(
                                      text: '이용약관',
                                      Menu_Icon: 'asstes/policy.svg',
                                      onTap: (){},
                                    ),
                                    ListTile_main(
                                        text: '피드백',
                                        Menu_Icon: 'asstes/feedback.svg',
                                        onTap: (){}),
                                    ListTile_main(
                                        text: '로그아웃',
                                        Menu_Icon: 'asstes/logout.svg', onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NewLoignMain()),
                                      );
                                    }
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150.h,
                          width: double.infinity,
                          color: Color(0xffEDEDED),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 32.w,
                              ),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Image.asset(
                                        'asstes/SUCHAT.png',
                                        scale: 3,
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                                        'Copyright 2023.\nFlag inc. all rights reserved.',
                                        style: TextStyle(
                                          color: Color(0xff767676),
                                          fontFamily: 'Pretendard',
                                          fontSize: 10.sp,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.25.sp,
                                        ),
                                      ),
                                      resign_Button(),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        ),

        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 18.h,
              ),
              Container(
                child: Container(
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
              ),
              Container(
                height: 331.h,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(color: Colors.white),
                child: Transform.scale(
                  scale: 1,
                  child: Transform.translate(
                    offset: const Offset(25, -60),
                    child: Image.asset('asstes/bubble_main.PNG', scale: 1.sp,fit: BoxFit.fill,),
                  ),
                ),
              ),
              Container(
                child: CustomButton_main(
                  text: '매칭 시작하기',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MatchingLoading()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
                width: double.infinity,
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
                    letterSpacing: -0.4.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                width: double.infinity,
              ),
              Container(
                height: 20.h,
                width: double.infinity,
                child: Text(
                  '@copyright by Flag',textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff767676),
                    fontFamily: 'Pretendard',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3.sp,

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
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
        borderRadius: BorderRadius.circular(25.w),
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

class ListTile_main extends StatelessWidget {
  final String text;
  final String Menu_Icon;
  final VoidCallback onTap;

  const ListTile_main({
    required this.text,
    required this.Menu_Icon,
    required this.onTap
});
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: SvgPicture.asset(Menu_Icon),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Pretendard',
          fontSize: 16.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.4.sp,
        ),
      ),
      onTap: onTap,
      trailing: Image.asset(
    'asstes/Vector6.png',
    scale: 4.sp,
    )
    );
  }
}

class resign_Button extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: () {},
      child: Text(
        '회원 탈퇴하기 >',
        style: TextStyle(
          color: Color(0xff767676),
          fontFamily: 'Pretendard',
          fontSize: 12.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3.sp,
        ),
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero),
    );
  }
}