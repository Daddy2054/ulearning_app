// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';

class SignUpController {
  final WidgetRef ref;
  SignUpController({
    required this.ref,
  });

  void handleSignUp() {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

    print("Your name is $name");
    print("Your email is $email");
    print("Your password is $password");
    print("Your rePassword is $rePassword");

    if(state.password!=state.rePassword){
      print("your password does not match");
      
    }
  }
}
