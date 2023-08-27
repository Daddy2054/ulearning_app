import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/notifier/welcome_notifier.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

//final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();
  //int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   // print('my dots value is $dotsIndex');
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  // showing our three welcome pages
                  child: PageView(
                    onPageChanged: (value) {
                      print('---my index value is $value');
                    //  dotsIndex = value;
                      ref.read(indexDotProvider.notifier).changeIndex(value);
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      appOnboardingPage(
                        _controller,
                        imagePath: 'assets/images/reading.png',
                        title: 'First See Learning',
                        subtitle:
                            'Forget about the paper, now learning all in one place',
                        index: 1,
                      ),
                      appOnboardingPage(
                        _controller,
                        imagePath: 'assets/images/man.png',
                        title: 'Connect with everyone',
                        subtitle:
                            "Always keep in touch with your tutor and friends. Let's get connected",
                        index: 2,
                      ),
                      appOnboardingPage(
                        _controller,
                        imagePath: 'assets/images/boy.png',
                        title: 'Always Fascinated Learning',
                        subtitle:
                            'Anywhere, anytime. The time is at your discretion. So study whenever you are',
                        index: 3,
                      ),
                    ],
                  ),
                ),
                //showing dots
                Positioned(
                  //left: 20,
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
