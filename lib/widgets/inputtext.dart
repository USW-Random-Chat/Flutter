import 'package:flutter/material.dart';

class InputTextFD extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String title;
  final bool Error;
  final String ErrorText;

  const InputTextFD({
    required this.controller,
    required this.onChanged,
    required this.hintText,
    required this.title,
    required this.Error,
    required this.ErrorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Pretendard-Light',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            if (Error)
              Text(
                ErrorText,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(
                fontFamily: 'Pretendard-Light',
                fontSize: 14,
              ),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
