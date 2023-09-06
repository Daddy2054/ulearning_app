import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widget.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/search_widgets.dart';
import '../controller/home_controller.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  // @override
  // void initState() {
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    _controller = PageController(
      initialPage: ref.watch(
        homeScreenBannerDotsProvider,
      ),
    );
    super.didChangeDependencies();
  }

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
              helloText(),
              userName(),
              SizedBox(
                height: 20.h,
              ),
              searchBar(),
              SizedBox(
                height: 20.h,
              ),
              banner(
                ref: ref,
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
