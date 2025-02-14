import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User?> firebaseUser = Rx<User?>(auth.currentUser);

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    // firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     Get.offAllNamed('/SignUp');
  //   } else {
  //     Get.offAllNamed('/home');
  //   }
  // }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      Get.offAllNamed('/SignUp');
    } else {
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
      Get.offAllNamed('/home');
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
    auth.currentUser!.reload();
  }

  void sendPasswordForgotEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (firebaseAuthException) {
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
      Get.offAllNamed('/home');
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
    Get.offAllNamed('/SignIn');
    hideLoading();
  }

  void updatePassword(String password) async {
    try {
      showLoading();
      await auth.currentUser!.updatePassword(password);
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

  void deleteAccount() async {
    try {
      showLoading();
      await auth.currentUser!.delete();
      hideLoading();
      Get.offAllNamed('/SignUp');
    } catch (firebaseAuthException) {
      hideLoading();
      Get.snackbar(
        "Error",
        firebaseAuthException.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
