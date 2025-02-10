import 'package:cine_loomi/themes/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_login/micro_app_login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home: SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
