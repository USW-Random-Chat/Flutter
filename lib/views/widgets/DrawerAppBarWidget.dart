import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerAppBarWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DrawerAppBarWidget({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double iconScale = 4.sp;
    double iconButtonPadding = 40.sp;

    return Container(
      width: double.maxFinite,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 아이콘 맨 오른쪽 정렬 위해서 왼쪽에 더미공간 추가
          SizedBox(
            width: iconScale + iconButtonPadding,
            height: iconScale + iconButtonPadding,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Pretendard-Regular',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              'assets/close.png',
              scale: iconScale,
            ),
          ),
        ],
      ),
    );
  }
}
