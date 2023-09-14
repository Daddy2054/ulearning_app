import '../models/course_entities.dart';
import '../services/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
   var response= await HttpUtil().post(
      'api/courseList'
    );
   return  CourseListResponseEntity.fromJson(response);
  }
}