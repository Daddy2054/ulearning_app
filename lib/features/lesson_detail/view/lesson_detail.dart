// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../common/utils/image_res.dart';
import '../../../common/widgets/image_widgets.dart';
import '../controller/lesson_controller.dart';
class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;

    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //   var lessonDetail = ref.watch(lessonDetailControllerProvider(index: args.toInt()));
    var lessonData = ref.watch(lessonDataControllerProvider);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: lessonData.value==null
    //      child: lessonData.value!.lessonItem.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    lessonData.when(
                        data: (data) => Container(
                              width: 325.w,
                              height: 200.h,
                      //        decoration: networkImageDecoration(imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${data.lessonItem[0].thumbnail}",),
                              child: FutureBuilder(
                                future: data.initializeVideoPlayer,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return videoPlayerController == null
                                        ? Container()
                                        : Stack(
                                            children: [
                                              VideoPlayer(
                                                  videoPlayerController!),
                                            ],
                                          );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ),
                        error: (e, t) => const Text("error"),
                        loading: () => const Text("Loading")),
                    Padding(
                      padding:  EdgeInsets.only(left: 25.w,right: 25.w, top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child:  AppImage(
                              width: 24.w,
                              height: 24.h,
                              imagePath: ImageRes.left,),
                          ),
                          SizedBox(width: 15.h,),
                          GestureDetector(
                              child:  AppImage(
                                width: 24.w,
                                height: 24.h,
                                imagePath: ImageRes.pause,),
                          ),
                          SizedBox(width: 15.h,),
                          GestureDetector(
                            child:  AppImage(
                              width: 24.w,
                              height: 24.h,
                              imagePath: ImageRes.right,),
                          )
                        ],
                      ),
                    )

                  ],
                ),
        ));
  }
}
