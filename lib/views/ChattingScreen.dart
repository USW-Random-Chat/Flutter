import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:suwon/views/HomeScreen.dart';
import 'package:suwon/viewmodels/ChattingVM.dart';

class RandomChat extends StatefulWidget {
  const RandomChat({Key? key});

  @override
  State<RandomChat> createState() => _RandomChatState();
}

class _RandomChatState extends State<RandomChat> {
  late ChatViewModel viewModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<ChatViewModel>(context, listen: false);
    viewModel.initialize();

    viewModel.addListener(_scrollToEnd); // 새 메시지 추가 시 스크롤
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 리소스 해제
    super.dispose();
  }

  void _scrollToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: 812.h,
          child: Column(
            children: [
              _Header(),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: viewModel.chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = viewModel.chatMessages[index];
                    return _ChatBubble(message: message.contents);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                height: 58.h,
                child: _CustomTextField(viewModel: viewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatefulWidget {
  final ChatViewModel viewModel;

  _CustomTextField({Key? key, required this.viewModel}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: '채팅을 시작하세요...',
        hintStyle: TextStyle(
          color: Color(0xff737373),
          fontFamily: 'Pretendard-Regular',
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.only(left: 17.w, top: 12, bottom: 12),
        suffixIcon: GestureDetector(
          onTap: () {
            String message = _textController.text;
            if (message.isNotEmpty) {
              widget.viewModel.sendMessage(message);
              _textController.clear();
            }
          },
          child: SvgPicture.asset(
            'assets/onchatbt.svg',
            width: 40.w,
            height: 40.h,
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chattingViewModel = Provider.of<ChatViewModel>(context);
    return Container(
      height: 128.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(right: 32.w, left: 32.w, bottom: 14.h),
      color: Color(0xff4D76C8),
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/User.svg',
                  width: 32.w,
                  height: 32.h,
                ),
                SizedBox(width: 12.w),
                Text(
                  '닉네임',
                  style: TextStyle(
                    fontFamily: 'KCCChassam',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 130.w),
          GestureDetector(
            child: SvgPicture.asset(
              'assets/Report button.svg',
              width: 40.w,
              height: 40.h,
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: SvgPicture.asset(
              'assets/Exit.svg',
              width: 38.w,
              height: 38.h,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String message;

  const _ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
