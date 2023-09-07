import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';

AppBar buildAppBar({String title = ''}) {

  return AppBar(
    title: Text16Normal(text: title, color: AppColors.primaryText),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1,
      ),
    ),
  );
}