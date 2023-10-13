// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../utils/image_res.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder,
  BorderRadius? borderRadius,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.h),
      topRight: Radius.circular(20.h),
    ),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourthElementText,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;
  final Function()? func;

  const AppBoxDecorationImage({
    Key? key,
    this.width = 40,
    this.height = 40,
    this.imagePath = ImageRes.profile,
    this.fit = BoxFit.fitHeight,
    this.courseItem,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: fit,
              image: NetworkImage(
                imagePath,
              ),
            ),
            borderRadius: BorderRadius.circular(20.w)),
        child: courseItem == null
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 20.w,
                    ),
                    child: FadeText(
                      text: courseItem!.name!,
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20.w,
                      bottom: 30.h,
                    ),
                    child: FadeText(
                      text: '${courseItem!.lesson_num!} Lessons',
                      color: AppColors.primaryFourthElementText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
BoxDecoration networkImageDecoration({required String imagePath}) {
  return BoxDecoration(image: DecorationImage(image: NetworkImage(imagePath)));
}