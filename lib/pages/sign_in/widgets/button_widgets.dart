import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appButton({
  String buttonName = '',
  double width = 325,
  double height = 50,
  bool isLogin = true,
}) {
  return GestureDetector(
    child: Container(
      width: width,
      height: height,
      decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          border: Border.all(
            color: AppColors.primaryFourthElementText,
          )),
      child: Center(
        child: text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
}
