import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../../common/utils/constants.dart';
import '../../global.dart';

Widget appOnboardingPage(
  PageController controller, {
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subtitle = '',
  index = 0,
  required BuildContext context,
}) {
  return Column(
    children: [
      // first page
      Image.asset(
        imagePath,
        fit: BoxFit.fitHeight,
      ),
      Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: text16Normal(text: subtitle),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        //remember if we are first time or not
        Global.storageService.setBool(
          AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY,
          true,
        );

        Navigator.pushNamed(
          context,
          "/signIn",
        );
        /* Navigator.push (
          context,
          MaterialPageRoute (
            builder: (BuildContext context) => const SignIn(),
          ),
        );*/
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(
        top: 100,
        left: 25,
        right: 25,
      ),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(
            text: index < 3 ? "next" : "Get started", color: Colors.white),
      ),
    ),
  );
}
