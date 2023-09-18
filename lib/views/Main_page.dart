import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
        appBar:
        AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20.sp),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset('asstes/SUCHAT.png',
                      width: 74.sp,
                      height: 20.sp,
                      fit: BoxFit.fill,)
                  ],
                )
              ],
            )
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
                        child:
                        IconButton(onPressed: (){
                          _scaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: SvgPicture.asset('asstes/Icon_menu.svg',
                          ),

                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 28.sp,)
                ],
              ),
            )
          ],
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.white,
          width: 250.sp,
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              Column(
              children: [
                Container(
                height: 90.sp,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: 190.sp,),
                    IconButton(onPressed: (){}, icon: Image.asset('asstes/close.png', scale: 4,))
                  ],
                ),
                ),
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('asstes/Group.png'),
                  ),
                  currentAccountPictureSize: Size(49.sp,49.sp),
                  accountName: Text('AnSungMin',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'KCCChassam',
                      fontSize: 22.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  accountEmail: Text('# ISTP',
                    style: TextStyle(
                      color: Color(0xff767676),
                      fontFamily: 'KCCChassam',
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  height: 400.sp,
                  decoration: BoxDecoration(border: Border(
                    top: BorderSide(color: Color(0xffEDEDED), width: 1, ),
                    bottom: BorderSide(color: Color(0xffEDEDED), width: 1),
                  )),
                  child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 59.sp,),
                          ListTile(
                            leading: SvgPicture.asset('asstes/profile.svg'),
                            title: Text('프로필 수정',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pretendard',
                              fontSize: 16.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.4.sp,
                            ),),
                            onTap: (){},
                            trailing: Image.asset('asstes/Vector6.png', scale: 4,),

                          ),
                          ListTile(
                            leading: SvgPicture.asset('asstes/policy.svg'),
                            title: Text('이용약관',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pretendard',
                                fontSize: 16.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.4.sp,
                              ),),
                            onTap: (){},
                            trailing: Image.asset('asstes/Vector6.png', scale: 4,),

                          ),
                          ListTile(
                            leading: SvgPicture.asset('asstes/feedback.svg'),
                            title: Text('피드백',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pretendard',
                                fontSize: 16.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.4.sp,
                              ),),
                            onTap: (){},
                            trailing: Image.asset('asstes/Vector6.png', scale: 4,),

                          ),
                          ListTile(

                            leading: SvgPicture.asset('asstes/logout.svg'),
                            title: Padding(
                              padding: EdgeInsets.zero,
                              child: Text(
                                '로그아웃',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Pretendard',
                                  fontSize: 16.sp,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.4.sp,
                                ),
                              ),
                            ),
                            onTap: () {},
                            trailing: Image.asset('asstes/Vector6.png', scale: 4,),
                          )
                          ,

                          SizedBox(height: 100.sp,)
                        ],
                      )
                ),
                Container(
                  height: 250.sp,
                  width: 250.sp,
                  color: Color(0xffEDEDED),
                child:Row(
                  children: [SizedBox(width: 32.sp,),
                  Column(
                    children: [Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.sp,),
                        Image.asset('asstes/SUCHAT.png', scale: 3,),
                        SizedBox(height: 12.sp,),
                        Text('Copyright 2023.\nFlag inc. all rights reserved.',
                          style: TextStyle(
                            color: Color(0xff767676),
                            fontFamily: 'Pretendard',
                            fontSize: 10.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25.sp,
                          ),),
                        TextButton(onPressed: (){},
                          child: Text('회원 탈퇴하기 >',
                            style: TextStyle(
                              color: Color(0xff767676),
                              fontFamily: 'Pretendard',
                              fontSize: 12.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.3.sp,
                            ),),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero
                          ),)
                      ],
                    )],
                  )
                  ],
                ),)
              ],
            )

            ],
          ),

        ),
        body: Container(
          color: Colors.white,

          child: Column(children: [
            SizedBox(height: 18.sp,),
            Container(
              child: Container(
                child: Text('_배너',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                  alignment: Alignment.center,
                height: 55.sp,
                width: 390.sp,
                color: Color(0xffDBDBDB),
              )
            ),
            Container(clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Transform.scale( scale: 1,
                child: Transform.translate(
                    offset: const Offset(25, -60),
                    child: Image.asset('asstes/bubble_main.PNG'),),
              ),
            ),
            Container(
              child: CustomButton_main(text: '매칭 시작하기', onPressed: (){},),
            ),
            SizedBox(height: 24.sp,),
            Container(
              child: Text('주의!! 욕설 및 상대방에게 불쾌함을 주는 채팅\n         적발 시 계정 이용이 제한됩니다   ',
              style: TextStyle(
                  color: Color(0xff767676),
                  fontFamily: 'KCCChassam',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  letterSpacing: -0.4.sp,

              )   ,),
            ),
            SizedBox(height: 120.sp,),
            Container(
              child: Text('@copyright by Flag',
              style: TextStyle(
                  color: Color(0xff767676),
                  fontFamily: 'Pretendard',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3.sp,
              ) ,),
            )


          ],
          ),
        ),
      ),);
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
      height: 64.sp,
      width: 334.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
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

