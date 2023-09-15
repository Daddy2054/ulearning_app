import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/global.dart';

import '../../../common/api/course_api.dart';
import '../../../common/models/course_entities.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() => 0;

  void setIndex(int value) {
    state = value;
  }
}

@riverpod
class HomeUserProfile extends _$HomeUserProfile {
  @override
  FutureOr<UserProfile> build() {
    return Global.storageService.getUserProfile();
  }
}

@Riverpod(keepAlive: true)

class HomeCourseList extends _$HomeCourseList{

  Future<List<CourseItem>?>_fetchCourseList() async {
    var result = await CourseAPI.courseList();
    if(result.code==200){
      return result.data;
    }
    return null;
  }

  @override
  FutureOr<List<CourseItem>?> build() async{
    return _fetchCourseList();
  }

}