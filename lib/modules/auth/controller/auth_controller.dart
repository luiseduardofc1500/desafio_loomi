import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed('/SignUp');
    } else {
      Get.offAllNamed('/home');
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed('/SignUp');
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAllNamed('/home');
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  showLoading() {
    Get.defaultDialog(
      title: "Loading",
      content: CircularProgressIndicator(),
    );
  }

  hideLoading() {
    Get.back();
  }

  Future register(String email, password) async {
    try {
      showLoading();

      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      hideLoading();
    } catch (firebaseAuthException) {
      hideLoading();
      Get.snackbar(
        "Error",
        firebaseAuthException.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void updateUsername(String username) {
    auth.currentUser!.updateDisplayName(username);
  }

  void setUserPhoto(String photoUrl) {
    auth.currentUser!.updatePhotoURL(photoUrl);
  }

  void sendPasswordForgotEmail(String email) async {
    try {
      showLoading();
      await auth.sendPasswordResetEmail(email: email);
      hideLoading();
    } catch (firebaseAuthException) {
      hideLoading();
      Get.snackbar(
        "Error",
        firebaseAuthException.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future login(String email, password) async {
    try {
      showLoading();

      await auth.signInWithEmailAndPassword(email: email, password: password);
      await Future.delayed(Duration(seconds: 2));
      hideLoading();
    } catch (firebaseAuthException) {
      hideLoading();
      Get.snackbar(
        "Error",
        firebaseAuthException.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    showLoading();
    await auth.signOut();
    hideLoading();
  }
}
