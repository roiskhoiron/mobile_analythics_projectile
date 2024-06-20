import 'application_performance_analytics.dart';
import 'firebase_analytics_service.dart';

class MarketingRetentionAnalytics {
  final analysis = FirebaseAnalyticsService();



  void recordUserSource(String userSource) {
    // Record user source
    analysis.logEvent(
      name: 'user_source',
      parameters: {
        'source': userSource,
      },
    );
  }

  void recordRetentionRate(double retentionRate) {
    // Record retention rate
    analysis.logEvent(
      name: 'retention_rate',
      parameters: {
        'rate': retentionRate,
      },
    );
  }
}