import 'package:flutter/material.dart';
import 'package:suwon/views/widgets/TextFontWidget.dart';

class IdTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const IdTextFieldWidget({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Color(0xFFBFBFBF),
              ),
            ),
          ),
          child: TextFormField(
            maxLength: 20,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF989898),
              ),

              hintText: '  아이디 입력',
              counterText: '', // 입력 길이 카운터 텍스트를 빈 문자열로 설정하여 표시하지 않음
              errorStyle: TextStyle(height: 0), // 에러 메시지 표시 공간을 없앰
            ),
          ),
        ),
      ],
    );
  }
}
