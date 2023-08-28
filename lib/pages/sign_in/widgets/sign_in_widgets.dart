import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/*
  preferredSize widget gives you a height or space from the appbar downwords and we can
  put child in the given space

 */
AppBar buildAppBar() {
  return AppBar(
    title: text16Normal(text: 'Login', color: AppColors.primaryText),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.amber,
        height: 1,
      ),
    ),
  );
}

Widget thirtPartyLogin() {
  return Container(
    margin: EdgeInsets.only(
      left: 80.w,
      right: 80.w,
      top: 40.h,
      bottom: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton('assets/icons/google.png'),
        _loginButton('assets/icons/apple.png'),
        _loginButton('assets/icons/facebook.png'),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset(imagePath),
    ),
  );
}
