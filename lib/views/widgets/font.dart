import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFont {
  static Widget fontRegular({
    required String text,
    required double fontSize,
    required Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Pretendard-Regular',
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static Widget fontSemiBold({
    required String text,
    required double fontSize,
    required Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Pretendard-SemiBold', // 여기에 원하는 폰트 설정
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
