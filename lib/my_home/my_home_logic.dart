import 'package:analythic_projectile/analytics/analytic.io.dart';
import 'package:get/get.dart';

import 'my_home_state.dart';

class MyHomeLogic extends GetxController {
  final MyHomeState state = MyHomeState();

   var counter = 0.obs;

  void incrementCounter() {
      counter++;
    AnalyticIO.marketingRetention.recordRetentionRate(counter.value.toDouble());
  }
}
