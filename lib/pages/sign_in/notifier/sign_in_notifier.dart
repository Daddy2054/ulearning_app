import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());

    void onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }
  void onUserPasswordChange(String password){
    state = state.copyWith(password: password);
  }
}
