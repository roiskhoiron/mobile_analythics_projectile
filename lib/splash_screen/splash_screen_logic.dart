import 'package:get/get.dart';

import 'splash_screen_state.dart';

class SplashScreenLogic extends GetxController {
  final SplashScreenState state = SplashScreenState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed('/home');
    });
  }
}
