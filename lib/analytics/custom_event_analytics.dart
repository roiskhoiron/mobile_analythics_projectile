import 'firebase_analytics_service.dart';

class CustomEventAnalytics {
  final analysis = FirebaseAnalyticsService();

  static void recordCustomEvent(
      String eventName, Map<String, dynamic> eventData) {
    // Record custom event
  }
}
