import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suwon/viewmodels/AccountRecoveryVM.dart';
import 'package:suwon/viewmodels/LoginVM.dart';
import 'package:suwon/viewmodels/SignupVM.dart'; // 추가: SignupViewModel 임포트
import 'package:suwon/views/LoginScreen.dart';
import 'package:suwon/views/SignUpScreen.dart';

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
        ChangeNotifierProvider(create: (context) => LoginVM()),
        ChangeNotifierProvider(
            create: (context) => SignupVM()), // 추가: SignupViewModel 제공
        ChangeNotifierProvider(create: (context) => AccountRecoveryVM()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
