import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/models/course_entities.dart';
import '../../../common/models/lesson_entities.dart';
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
      margin: EdgeInsets.only(left: 0, top: 15.h),
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
      margin: EdgeInsets.only(left: 0, top: 20.h),
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
          CourseInfo(
            imagePath: ImageRes.downloadDetail,
            length: courseItem.down_num,
            infoText: "Number of items to download",
          ),
          // SizedBox(
          //   height: 16.w,
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

class LessonInfo extends StatelessWidget {
  final List<LessonItem> lessonData;
  const LessonInfo({Key? key, required this.lessonData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          lessonData.isNotEmpty
              ? const Text14Normal(
                  text: "Lesson list",
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                )
              : const Text14Normal(
                  text: "Lesson list is empty",
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: lessonData.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 325.w,
                  height: 80.h,
                  decoration: appBoxShadow(
                      radius: 10,
                      sR: 2,
                      bR: 3,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/lesson_detail',
                          arguments: {'id': lessonData[index].id!});
                    },
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppBoxDecorationImage(
                          width: 60.w,
                          height: 60.w,
                          imagePath:
//                              "${AppConstants.IMAGE_UPLOADS_PATH}${lessonData[index].thumbnail}",
                              "${AppConstants.IMAGE_UPLOADS_PATH}default.png",
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text13Normal(text: lessonData[index].name),
                                Expanded(
                                    child: Text10Normal(
                                        text: lessonData[index].description!)),
                              ],
                            ),
                          ),
                        ),
                        // Expanded(child:Container()),
                        const AppImage(
                          imagePath: ImageRes.arrowRight,
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
