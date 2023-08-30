import 'package:flutter_riverpod/flutter_riverpod.dart';

import './notifier/sign_in_notifier.dart';

class SignInController {
  WidgetRef ref;

  SignInController(this.ref);

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
  }
}
