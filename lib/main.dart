import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes.dart';
import 'common/utils/app_styles.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
  // HttpUtil().post('api/login', queryParameters: {
  //   'name': 'test1',
  //   'email': 'cabc@a.com',
  //   'password': '123456',
  //   'avatar': 'xyz.com',
  //   'type': '2',
  //   'open_id': 'shfdgksdjh'
  // });
  // ;

  /// lesson 154. Dart callable property with Riverpod implementation
//   var person = Person('dbestech', 3);
//   //print(person.name);
//   var x = person(add: 'xyz');
//   print(person.address);
// }

// class Person {
//   String name;
//   int age;
//   String? address;
//   Person(this.name, this.age, {this.address});
//   Person call({required String add}) {
//    // print(address);
//     address = add;
//     return this;
//   }
// }

//  /// lesson 154. stop testing
//  ///
//  ///
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        navigatorKey: navKey,
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        onGenerateRoute: AppPages.generateRouteSettings,
      ),
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 3;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);

    return Scaffold(
      appBar: AppBar(
        title: const Text('riverpod app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const SecondPage(),
              ),
            ),
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_alt_outlined),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () => ref.read(appCount.notifier).state++,

            // onPressed: () {
            //   print('hello');
            // },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '$count',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
