import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
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
                      height: 20.sp,)
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
                        IconButton(onPressed: (){},
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
        body: Container(
          color: Colors.white,

          child: Column(children: [
            SizedBox(height: 24.sp,),
            Container(

              child: Text('_배너',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
              ),
              width: 390.sp,
              height: 55.sp,
              color: Color(0xffDBDBDB),
            ),
            SizedBox(height: 69.sp,),

          ],
          ),
        ),
      ),);
  }
}
