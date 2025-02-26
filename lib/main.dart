import 'package:cine_loomi/app.dart';
import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/auth/controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });

  runApp(
    const App(),
  );
}
