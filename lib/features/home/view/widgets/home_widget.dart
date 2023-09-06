import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

Widget banner() {
  return Column(
    children: [
      SizedBox(
        width: 325.w,
        height: 160.h,
        child: PageView(
          children: [
            bannerContainer(imagePath: ImageRes.banner1),
            bannerContainer(imagePath: ImageRes.banner2),
            bannerContainer(imagePath: ImageRes.banner3),
          ],
        ),
      ),
         SizedBox(height: 5.h,),
      //dots
    
    ],
  );
}

Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.fill,
    )),
  );
}

Widget userName() {
  return Container(
    child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontWeight: FontWeight.bold),
  );
}

Widget helloText() {
  return Container(
    child: text24Normal(
      text: "Hello2, ",
      color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.bold,
    ),
  );
}
