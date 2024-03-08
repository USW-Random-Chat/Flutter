import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuchatAppBarWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SuchatAppBarWidget({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //상단 회원가입+뒤로가기 버튼
      width: double.maxFinite,

      height: 60.h,
      child: Row(
        children: [
          SizedBox(
            child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 18.sp,
                )),
          ),
          Container(
            alignment: Alignment.center,
            width: 259.w,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'Pretendard-Regular',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

/*Container(
              color: Colors.red,
              child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 18.sp,
                  )),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'Pretendard-Regular',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
*/