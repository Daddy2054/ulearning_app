import 'package:flutter/material.dart';
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
