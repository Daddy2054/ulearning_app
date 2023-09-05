import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/sign_in/view/widgets/image_widgets.dart';
import '../utils/app_colors.dart';
import '../utils/image_res.dart';
import 'app_shadow.dart';
import 'app_textfields.dart';

Widget searchBar() {
  return Row(
    children: [
      // search text box
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            boxBorder: Border.all(color: AppColors.primaryFourthElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: appImage(imagePath: ImageRes.searchIcon),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: appTextFieldOnly(
                  width: 240, height: 40, hintText: "Search your course..."),
            )
          ],
        ),
      ),
      //search button
    ],
  );
}
