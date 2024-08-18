import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:suwon/viewmodels/MatchingVM.dart';
import 'package:suwon/views/ChattingScreen.dart';
import 'package:suwon/views/HomeScreen.dart';
import 'package:suwon/views/chat_test.dart';
import 'package:suwon/views/widgets/CustomButtonWidget.dart';

class MatchingLoadingScreen extends StatefulWidget {
  const MatchingLoadingScreen({Key? key}) : super(key: key);

  @override
  _MatchingLoadingState createState() => _MatchingLoadingState();
}

class _MatchingLoadingState extends State<MatchingLoadingScreen> {
  final MatchingViewModel _matchingViewModel = MatchingViewModel();
  StreamController<int> dotStreamController = StreamController<int>();
  int numDots = 0;
  StompClient? _stompClient;

  @override
  void initState() {
    super.initState();
    connectStomp(); // STOMP 통신 시작
    _startAnimation();
    _startMatching(); // 매칭 시작
  }

  void connectStomp() {
    _stompClient = StompClient(
      config: StompConfig(
        url: 'ws://43.202.91.160:8080/stomp',
        onConnect: (StompFrame frame) {
          print('STOMP connected');
        },
        onWebSocketError: (dynamic error) => print('STOMP error: $error'),
      ),
    );
    _stompClient?.activate();
  }

  void _startMatching() async {
    String account = 'admin';

    // MatchingViewModel 인스턴스를 가져옵니다.
    final matchingViewModel =
        Provider.of<MatchingViewModel>(context, listen: false);

    // 매칭 요청을 보냅니다.
    matchingViewModel.requestMatch(account);

    // 매칭 결과를 구독합니다.
    matchingViewModel.addListener(() {
      if (matchingViewModel.isMatched) {
        // 매칭이 완료되었을 때, 채팅 화면으로 이동합니다.
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
          (Route<dynamic> route) => false,
        );
      } else if (!matchingViewModel.isMatching) {
        // 매칭이 취소되거나 실패했을 때, 알림을 표시합니다.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('매칭이 취소되었거나 실패했습니다.')),
        );
      }
    });
  }

  @override
  void dispose() {
    dotStreamController.close();
    _matchingViewModel.dispose();
    _stompClient?.deactivate(); // STOMP 연결 해제
    super.dispose();
  }

  // 애니메이션을 시작하는 함수
  void _startAnimation() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (numDots < 3) {
        numDots++;
      } else {
        numDots = 0;
      }
      dotStreamController.sink.add(numDots);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 295.h),
                padding: EdgeInsets.only(left: 100.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    KCCChassam(
                      color: Color(0xff000000),
                      text: '매칭 중',
                      fontsize: 40.sp,
                    ),
                    StreamBuilder<int>(
                      stream: dotStreamController.stream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        final dots = '.' * (snapshot.data ?? 0);
                        return KCCChassam(
                          color: Color(0xff000000),
                          text: dots,
                          fontsize: 40.sp,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              KCCChassam(
                color: Color(0xff2D64D8),
                text: '알고 계셨나요',
                fontsize: 20.sp,
              ),
              SizedBox(height: 18.h),
              KCCChassam(
                color: Color(0xff767676),
                text: '아이디어 내주세요',
                fontsize: 16.sp,
              ),
              SizedBox(height: 60.h),
              CustomButtonWidget(
                text: '매칭 중단하기',
                backgroundColor: Color(0xff111111),
                onPressed: () {
                  _matchingViewModel.cancelMatch('admin');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                color: Color(0xffFFFFFF),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget KCCChassam({
    required Color color,
    required String text,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w400,
        fontFamily: 'KCCChassam',
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
