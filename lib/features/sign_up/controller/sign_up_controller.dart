// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/features/sign_up/provider/register_notifier.dart';

import '../../../common/widgets/popup_messages.dart';

class SignUpController {
  final WidgetRef ref;
  SignUpController({
    required this.ref,
  });

  void handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      //   print("your password does not match");
      toastInfo("your password does not match");
      return;
    }

//show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    Future.delayed(const Duration(seconds: 2), () async {
      var context = Navigator.of(ref.context);
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (kDebugMode) {
          print(credential);
        }
        if (credential.user != null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(name);
          //get server photo url
          //set user photo url
          toastInfo(
              'A message has been sent to verify your account.Please open that and email');
          (context).pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          toastInfo("This password is too weak");
        } else if (e.code == 'email-already-in-use') {
          toastInfo("This email address has already been registered");
        } else if (e.code == 'user-not-found') {
          toastInfo("User not found");
        }
      } catch (e) {
        if (kDebugMode) {
          e.toString();
        }

        ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
      }
    });
  }
}
