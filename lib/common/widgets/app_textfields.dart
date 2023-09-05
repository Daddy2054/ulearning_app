import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/sign_in/view/widgets/image_widgets.dart';
import 'app_shadow.dart';
import 'text_widgets.dart';

Widget appTextField({
  TextEditingController? controller,
  String text = '',
  String iconName = '',
  String hintText = 'Type in your info',
  bool obscureText = false,
  void Function(String value)? func,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              appTextFieldOnly(
                controller: controller,
                hintText: hintText,
                func: func,
                obscureText: obscureText,
              ),
              // SizedBox(
              //   width: 280.w,
              //   height: 50.h,
              //   child: TextField(
              //     controller: controller,
              //     onChanged: (value) =>func!(value),
              //     keyboardType: TextInputType.emailAddress,
              //     decoration: InputDecoration(
              //       hintText: hintText,
              //       enabledBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Colors.transparent,
              //         ),
              //       ),
              //       focusedBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Colors.transparent,
              //         ),
              //       ),
              //     ),
              //     maxLines: 1,
              //     autocorrect: false,
              //     obscureText: obscureText,
              //   ),
              // )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Type in your info",
  double width = 280,
  double height = 50,
  void Function(String value)? func,
  bool obscureText = false,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //default border without any input
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //focused border is with input
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),

      maxLines: 1,
      autocorrect: false,
      //by defualt it's false
      obscureText: obscureText,
    ),
  );
}
