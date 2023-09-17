import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/app_bar.dart';
import '../controller/course_detail_controller.dart';
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
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildGlobalAppbar(title: "Course detail"),
      body: SingleChildScrollView(
        child: stateData.when(
            data: (data) => data == null
                ? const SizedBox()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CourseDetailThumbnail(
                        courseItem: data,
                      ),
                      CourseDetailIconText(
                        courseItem: data,
                      ),
                      CourseDetailDescription(
                        courseItem: data,
                      ),
                        const CourseDetailGoBuyButton(),
                        CourseDetailIncludes(courseItem:data),
                        const LessonInfo(),
                    ],
                  ),
            error: (error, traceStack) => const Text("Error loading the data"),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
