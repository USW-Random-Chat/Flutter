import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/ChattingVM.dart';
import 'package:suwon/views/HomeScreen.dart';
import 'package:suwon/views/widgets/TextFontWidget.dart'; // 수정된 부분

void main() => runApp(FriendlychatApp());

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FriendlychatApp",
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final ChatViewModel chatViewModel = ChatViewModel(); // 수정된 부분

  @override
  void initState() {
    super.initState();
    chatViewModel.initialize(); // ChatViewModel을 초기화합니다.
  }

  @override
  void dispose() {
    chatViewModel.dispose(); // ViewModel을 정리합니다.
    super.dispose();
  }

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: 812.h,
          child: Column(
            children: <Widget>[
              Header(),
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: Row(
        children: <Widget>[
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFDBDBDB))),
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
                    _handleSubmitted(_textController.text);
                  }
                },
                child: SvgPicture.asset(
                  'assets/onchatbt.svg',
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    chatViewModel.sendMessage(text); // 메시지를 보내는 로직을 호출합니다.
    var message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message); // 새 메시지를 리스트에 추가합니다.
    });
  }
}

class Header extends StatelessWidget {
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

//내가 보낸 채팅
class ChatMessage extends StatelessWidget {
  ChatMessage({super.key, required this.text}); // 수정된 부분
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 1,
      ),
      padding: EdgeInsets.all(5.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: Color(0xffD3DFFF),
              borderRadius: BorderRadius.circular(25.w),
            ),
            child: TextFontWidget.fontRegular(
                text: text, fontSize: 16.sp, color: Colors.black),
          ),
        )
      ]),
    );
  }
}
