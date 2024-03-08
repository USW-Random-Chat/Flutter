import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/AccountRecovery_viewmodel.dart';
import 'package:suwon/viewmodels/login_viewmodel.dart';
import 'package:suwon/viewmodels/signup_viewmodel.dart'; // 추가: SignupViewModel 임포트
import 'package:suwon/views/login_screen.dart';
import 'package:suwon/views/signup_creen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ChangeNotifierProvider 대신 MultiProvider로 변경
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(
            create: (context) => SignupViewModel()), // 추가: SignupViewModel 제공
        ChangeNotifierProvider(
            create: (context) => AccountRecoveryViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewLoignMain(),
      ),
    );
  }
}
