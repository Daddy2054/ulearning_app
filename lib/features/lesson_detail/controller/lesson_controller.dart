import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/models/lesson_entities.dart';
import '../../../common/utils/constants.dart';
import '../repo/lesson_repo.dart';
import 'package:video_player/video_player.dart';

part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(LessonDetailControllerRef ref,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await LessonRepo.courseLessonDetail(params: lessonRequestEntity);

      //breakpoint here invoke exception
//       Unhandled exception:
// FormatException: Invalid radix-10 number (at character 1)
  if (response.code == 200) {
    var url =
        "${AppConstants.IMAGE_UPLOADS_PATH}${response.data!.elementAt(0).url!}";
     //"${AppConstants.IMAGE_UPLOADS_PATH}${response['data']!.elementAt(0)['video'].elementAt(0)['url']!}";
    print('my video url is $url');

    videoPlayerController = VideoPlayerController.networkUrl(url as Uri);

    var initializeVideoPlayerFuture = videoPlayerController?.initialize();
    LessonVideo vidInstance = LessonVideo(
        lessonItem: response.data!,
        isPlay: false,
        initializeVideoPlayer: initializeVideoPlayerFuture,
        url: url);
    ref
        .read(lessonDataControllerProvider.notifier)
        .updateLessonData(vidInstance);
  } else {
    if (kDebugMode) {
      print('request failed ${response.code}');
    }
  }
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  void updateLessonData(LessonVideo lessons) {
    update((data) => data.copyWith(
          url: lessons.url,
          initializeVideoPlayer: lessons.initializeVideoPlayer,
          lessonItem: lessons.lessonItem,
        ));
  }
}
