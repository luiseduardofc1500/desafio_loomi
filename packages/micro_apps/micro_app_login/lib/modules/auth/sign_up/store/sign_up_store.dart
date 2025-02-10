import 'package:mobx/mobx.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @computed
  bool get canSignUp =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword &&
      !isLoading;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  Future<void> signUp() async {
    if (!canSignUp) return;
    isLoading = true;
    errorMessage = '';
    try {
      // await AuthService.signUp(email: email, password: password);

      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      errorMessage = 'Failed to sign up: $e';
    } finally {
      isLoading = false;
    }
  }
}
