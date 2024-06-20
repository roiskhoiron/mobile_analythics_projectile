import 'firebase_analytics_service.dart';

class ConversionAnalytics {
  final analysis = FirebaseAnalyticsService();

  static void recordConversionRate(
      String conversionName, double conversionRate) {
    // Record conversion rate
  }
}
