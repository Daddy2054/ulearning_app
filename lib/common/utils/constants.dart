// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class AppConstants{
  static const String SERVER_API_URL = "http://192.168.0.149:8081/"; //  (db,api-> localhost)
  //static const String SERVER_API_URL = "http://10.0.2.2:8081/"; //  (db,api-> localhost)
  static String IMAGE_UPLOADS_PATH = "${SERVER_API_URL}uploads/";
  static const String STORAGE_USER_PROFILE_KEY = "user_profile";
  static const String STORAGE_USER_TOKEN_KEY = "user_token";
  static const String STORAGE_DEVICE_OPEN_FIRST_KEY="first_time";
}