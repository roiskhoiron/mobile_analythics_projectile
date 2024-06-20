import 'firebase_analytics_service.dart';

class ApplicationPerformanceAnalytics {
  final analysis = FirebaseAnalyticsService();

  static void recordResponseTime(
      String apiEndpoint, int responseTime, bool success) {
    // Record response time
  }

  static void recordApplicationError(String errorMessage) {
    // Record application error
  }

  void recordPerformance(
      {required String name, required Map<String, Object> datas}) {
    analysis.logEvent(
      name: name,
      parameters: datas,
    );
  }
}
