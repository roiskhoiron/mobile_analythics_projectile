import 'firebase_analytics_service.dart';

class UserBehaviorAnalytics {
  final analysis = FirebaseAnalyticsService();


  void recordEvent({
    required String eventName,
    Map<String, Object>? parameters,
  }) {
    analysis.logEvent(
      name: eventName,
      parameters: parameters,
    );
  }

  static void recordSessionDuration(int durationInMilliseconds) {
    // Record session duration
  }

  static void recordLocation(String location) {
    // Record user location
  }

  void recordScreenNavigation(String screenName) {
    analysis.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
    );
    analysis.setScreenView(screenName: screenName);
  }
}
