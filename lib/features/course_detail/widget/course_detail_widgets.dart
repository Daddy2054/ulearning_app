import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/models/course_entities.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_shadow.dart';
import '../../../common/widgets/button_widgets.dart';
import '../../../common/widgets/image_widgets.dart';
import '../../../common/widgets/text_widgets.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailThumbnail({
    Key? key,
    required this.courseItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
      child: AppBoxDecorationImage(
        imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
        width: 325.w,
        height: 200.h,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class CourseDetailIconText extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailIconText({
    Key? key,
    required this.courseItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: appBoxShadow(radius: 7),
              child: const Text10Normal(
                text: "Author Page",
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                const AppImage(imagePath: ImageRes.people),
                Text11Normal(
                  text: courseItem.follow == null
                      ? "0"
                      : courseItem.follow.toString(),
                  color: AppColors.primaryThirdElementText,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                const AppImage(imagePath: ImageRes.star),
                Text11Normal(
                  text: courseItem.score == null
                      ? "0"
                      : courseItem.score.toString(),
                  color: AppColors.primaryThirdElementText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailDescription({
    Key? key,
    required this.courseItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 25, top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: courseItem.name == null ? "No name found" : courseItem.name!,
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          Text11Normal(
            text: courseItem.description ?? "No description found",
            color: AppColors.primaryThirdElementText,
          )
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: const AppButton(
        buttonName: "Go buy",
      ),
    );
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailIncludes({
    Key? key,
    required this.courseItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Course includes",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 12.w,
          ),
          CourseInfo(
            imagePath: ImageRes.videoDetail,
            length: courseItem.video_len,
            infoText: "Hours video",
          ),
          SizedBox(
            height: 16.w,
          ),
          CourseInfo(
            imagePath: ImageRes.fileDetail,
            length: courseItem.lesson_num,
            infoText: "Number of files",
          ),
          SizedBox(
            height: 16.w,
          ),
          // CourseInfo(
          //   imagePath: ImageRes.downloadDetail,
          //   length: courseItem.down_num,
          //   infoText: "Number of items to download",
          // ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final int? length;
  final String? infoText;

  const CourseInfo({
    Key? key,
    required this.imagePath,
    this.length,
    this.infoText = "item",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: AppImage(
            imagePath: imagePath,
            width: 30,
            height: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Text11Normal(
            color: AppColors.primarySecondaryElementText,
            text: length == null ? "0 $infoText" : "$length $infoText",
          ),
        )
      ],
    );
  }
}
