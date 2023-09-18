import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/app_bar.dart';
import '../controller/course_controller.dart';
import '../widget/course_detail_widgets.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;

    args = id["id"];

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

@override
  Widget build(BuildContext context) {
    var courseData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    var lessonData =
        ref.watch(courseLessonListControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildGlobalAppbar(title: "Course detail"),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              courseData.when(
                  data: (data) => data == null
                      ? const SizedBox()
                      : Column(
                          children: [
                            CourseDetailThumbnail(
                              courseItem: data,
                            ),
                            CourseDetailIconText(courseItem: data),
                            CourseDetailDescription(courseItem: data),
                            const CourseDetailGoBuyButton(),
                            CourseDetailIncludes(courseItem: data),
                          ],
                        ),
                  error: (error, traceStack) =>
                      const Text("Error loading the course data"),
                  loading: () => SizedBox(
                    height: 500.h,
                    child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                  )),
              lessonData.when(
                  data: (data) => data == null
                      ? const SizedBox()
                      : LessonInfo(lessonData:data),
                  error: (error, traceStack) =>
                  const Text("Error loading the lesson data"),
                  loading: () => SizedBox(
                    height: 500.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
