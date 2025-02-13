import 'package:cine_loomi/utils/dialog_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseStorage _storage = FirebaseStorage.instance;

  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  // Future<String?> uploadProfilePicture(File profilePicture) async {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user == null) throw Exception("Usuário não autenticado");

  //     final ref = _storage
  //         .ref()
  //         .child('userProfilePictures/${user.uid}/profilePicture.jpg');
  //     final UploadTask uploadTask = ref.putFile(profilePicture);
  //     TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //     String downloadURL = await taskSnapshot.ref.getDownloadURL();

  //     return downloadURL;
  //   } catch (e) {
  //     Get.snackbar("Erro", "Falha ao fazer upload da foto de perfil: $e",
  //         snackPosition: SnackPosition.BOTTOM);
  //     return null;
  //   }
  // }

  Future<void> signUp(String email, String password) async {
    try {
      showLoading();
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // String? photoUrl;
      // if (photoController.selectedImage.value != null) {
      //   photoUrl = photoController.selectedImage.value!.path;
      // }

      // File image = File(photoUrl!);
      // if (name != null || photoUrl != null) {
      //   await userCredential.user!.updateProfile(
      //     displayName: name,
      //     photoURL: await image.readAsBytes().toString(),
      //   );
      //   await userCredential.user!.reload();
      // }

      firebaseUser.value = _auth.currentUser;
      hideLoading();
      Get.snackbar(
        "Sucess",
        "User created successfully!",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } on FirebaseAuthException catch (e) {
      hideLoading();
      Get.snackbar(
        "The signUp got an error",
        e.message ?? "Unknown error",
        snackPosition: SnackPosition.BOTTOM,
      );

      if (_auth.currentUser != null) {
        await _auth.currentUser!.delete();
        firebaseUser.value = null;
      }
    }
  }

  Future<void> updateProfile(
      {String? name, String? password, String? photoUrl}) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception("User not authenticated");

      showLoading();

      if (name != null && name.isNotEmpty) {
        await user.updateProfile(displayName: name);
        await user.reload();
      }

      if (password != null && password.isNotEmpty) {
        await user.updatePassword(password);
      }

      if (photoUrl != null) {
        await user.updateProfile(photoURL: photoUrl);
        await user.reload();
      }

      hideLoading();
      Get.snackbar(
        "Success",
        "Account updated successfully!",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } on FirebaseAuthException catch (e) {
      hideLoading();
      Get.snackbar(
        "Error",
        e.message ?? "Unknown error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      showLoading();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      hideLoading();
      Get.snackbar(
        "Sucesso",
        "Usuário logado com sucesso!",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } on FirebaseAuthException catch (e) {
      hideLoading();
      Get.snackbar(
        "Email ou senha incorretos",
        e.message ?? "Erro desconhecido",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    showLoading();
    try {
      await _auth.signOut();
      hideLoading();
      Get.snackbar(
        "Sucesso",
        "Logout efetuado com sucesso!",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      hideLoading();
      Get.snackbar(
        "Erro",
        "Não foi possível efetuar logout: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      showLoading();
      await _auth.sendPasswordResetEmail(email: email);
      hideLoading();
    } on FirebaseAuthException catch (e) {
      hideLoading();
      Get.snackbar(
        "Erro",
        e.message ?? "Erro desconhecido",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  showLoading() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
