import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text("SignIn page"),
          ),
        ),
      ),
    );
  }
}
