import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_screen_logic.dart';

class SplashScreenUi extends StatelessWidget {

  final logic = Get.find<SplashScreenLogic>();
  final state = Get.find<SplashScreenLogic>().state;

  SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {

    // splash screen with flutter logo and name aplication
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 150),
            Text(
              'Analythic Projectile',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
