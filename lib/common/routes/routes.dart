import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import '../../pages/application/application.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/sign_up/sign_up.dart';
import '../../pages/welcome/welcome.dart';
import 'app_routes_names.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("clicked route is ${settings.name}");
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      //if we used this is first time  or not
      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

      if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {}
    }
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({
    required this.path,
    required this.page,
  });
}
