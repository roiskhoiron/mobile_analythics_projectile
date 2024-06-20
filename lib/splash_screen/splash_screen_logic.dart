import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../analytics/analytic.io.dart';
import 'splash_screen_state.dart';

class SplashScreenLogic extends GetxController {
  final SplashScreenState state = SplashScreenState();


  @override
  Future<void> onInit() async {
    // get package info and device info
    var packageInfo = await PackageInfo.fromPlatform();
    AnalyticIO.platform.recordAppVersion(packageInfo.version);

    // get device info
    try {
      // get device info for android
      var diverInfo = await DeviceInfoPlugin().androidInfo;
      AnalyticIO.platform.recordDeviceType(diverInfo.device);
      AnalyticIO.platform.recordDeviceModel(diverInfo.model);
      AnalyticIO.platform.recordDeviceManufacture(diverInfo.manufacturer);
    } catch (e) {
      // get device info for ios
      var diverInfo = await DeviceInfoPlugin().iosInfo;
      AnalyticIO.platform.recordDeviceType(diverInfo.name);
      AnalyticIO.platform.recordDeviceModel(diverInfo.model);
      AnalyticIO.platform.recordDeviceManufacture(diverInfo.systemVersion);
    }



    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed('/home');
    });
  }


}
