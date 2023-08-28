import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/button_widgets.dart';
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
              appTextField(
                text: 'Email',
                iconName: 'assets/icons/user.png',
                hintText: 'Enter your email address',
              ),
              SizedBox(
                height: 20.h,
              ),
              appTextField(
                text: 'Password',
                iconName: 'assets/icons/lock.png',
                hintText: 'Enter your password',
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w, top: 20.h),
                child: textUnderLine(text: 'Forgot password?'),
              ),
              SizedBox(
                height: 100.h,
              ),
              // app login button
              Center(child: appButton(buttonName: 'Login')),
              SizedBox(
                height: 20.h,
              ),
              // app register button
              Center(
                child: appButton(
                  buttonName: 'Register',
                  isLogin: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
