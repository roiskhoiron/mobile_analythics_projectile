import 'package:analythic_projectile/my_home/my_home_binding.dart';
import 'package:analythic_projectile/my_home/my_home_ui.dart';
import 'package:analythic_projectile/splash_screen/splash_screen_binding.dart';
import 'package:analythic_projectile/splash_screen/splash_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'analytics/analytic.io.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AnalyticIO.initializeApp();

  AnalyticIO.userBehavior.recordUserActivity('App Start').start();
  await Future<void>.delayed(const Duration(seconds: 2));
  AnalyticIO.userBehavior.recordUserActivity('App Start').stop();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: AppBinding(),
      navigatorObservers: <NavigatorObserver>[AnalyticIO.observers, AnalyticIO.routeObserver],
      routingCallback: (routing) {
        print('routingCallback ${routing?.current}');
        if (routing == null) return;
        AnalyticIO.userBehavior.recordScreenNavigation(routing.current);
      },
      getPages: [
        GetPage(name: '/', page: () => SplashScreenUi(),  binding: SplashScreenBinding()),
        GetPage(name: '/home', page: () => MyHomeUi(), binding: MyHomeBinding()),
      ],
      initialRoute: '/',
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnalyticIO());
  }
}


