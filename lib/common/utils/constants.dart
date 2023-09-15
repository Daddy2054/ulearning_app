class AppConstants{
  static const String SERVER_API_URL = "http://10.0.2.2:8000/"; // phone hospot (laravel-> localhost)

  //static const String SERVER_API_URL = "http://192.168.0.149:8000/"; //local network (laravel-> local ip)
  static String IMAGE_UPLOADS_PATH = "${SERVER_API_URL}uploads/";
  static const String STORAGE_USER_PROFILE_KEY = "user_profile";
  static const String STORAGE_USER_TOKEN_KEY = "user_token";
  static const String STORAGE_DEVICE_OPEN_FIRST_KEY="first_time";
}