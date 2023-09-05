import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/text_widgets.dart';
import '../../../global.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Home"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: text24Normal(
                  text: "Hello2, ",
                  color: AppColors.primaryThirdElementText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: text24Normal(
                    //text: Global.storageService.getUserProfile()['name'],
                    text: Global.storageService.getUserProfile().name!,
                    // text: Global.storageService
                    //     .getString(AppConstants.STORAGE_USER_PROFILE_KEY),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
