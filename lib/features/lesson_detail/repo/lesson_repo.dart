import '../../../common/models/lesson_entities.dart';
import '../../../common/services/http_util.dart';

class LessonRepo {


  static Future<LessonListResponseEntity> courseLessonList(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .post("api/lessonDetail", queryParameters: params?.toJson());
    return LessonListResponseEntity.fromJson(response);
  }
}