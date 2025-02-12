import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Erro ao fazer login",
        e.message ?? "Erro desconhecido",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signUp(String email, String password,
      {String? name, String? photo}) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebaseUser.value = userCredential.user;

      if (name != null || photo != null) {
        await userCredential.user!.updateProfile(
          displayName: name,
          photoURL: photo,
        );
        await userCredential.user!.reload();
        firebaseUser.value = _auth.currentUser;
      }

      if (Get.isDialogOpen ?? false) Get.back();

      Get.snackbar(
        "Sucesso",
        "Usuário cadastrado com sucesso!",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      await Future.delayed(const Duration(seconds: 2));

      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();

      Get.snackbar(
        "Erro ao cadastrar",
        e.message ?? "Erro desconhecido",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar(
        "Erro",
        "Não foi possível sair: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
