import 'package:cine_loomi/app_pages.dart';
import 'package:cine_loomi/themes/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio Loomi',
      theme: appTheme(),
      defaultTransition: Transition.native,
      initialRoute: '/SignIn',
      getPages: AppPages.routes,
    );
  }
}
