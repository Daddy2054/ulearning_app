import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top login buttons
              thirtPartyLogin(),
              Center(
                child:
                    text14Normal(text: 'Or use your email account to log in'),
              ),
              SizedBox(
                height: 50.h,
              ),
              appTextField(text: 'Email'),
              SizedBox(
                height: 20.h,
              ),
              appTextField(text: 'Password'),
            ],
          ),
        ),
      ),
    );
  }
}
