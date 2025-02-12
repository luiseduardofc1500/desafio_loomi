import 'package:cine_loomi/modules/auth/routes/app_pages.dart';
import 'package:cine_loomi/modules/auth/routes/root.dart';
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
      home: Root(),
      getPages: AppPages.routes,
    );
  }
}
