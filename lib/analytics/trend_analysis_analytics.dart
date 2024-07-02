import 'analytics_engine_service.dart';

/// Class untuk mengelola analitik tren
/// seperti merekam event tren @[recordTrendEvent],
/// dan merekam perubahan tren @[recordTrendChange]
/// Contoh penggunaan:
/// recordTrendEvent('UserRegistration', 1);
/// recordTrendChange('UserRegistration', 0.5);
class TrendAnalysisAnalytics {
  final analysis = AnalyticsEngineService();

  /// Catat event tren
  /// [eventName] adalah nama event
  /// [eventValue] adalah nilai event
  /// Contoh penggunaan:
  /// recordTrendEvent('UserRegistration', 1);
  void recordTrendEvent(String eventName, int eventValue) {
    analysis.logEvent(
      name: eventName,
      parameters: {
        'value': eventValue,
      },
    );
  }

  /// Catat perubahan tren
  /// [trendName] adalah nama tren
  /// [changeValue] adalah nilai perubahan
  /// Contoh penggunaan:
  /// recordTrendChange('UserRegistration', 0.5);
  void recordTrendChange(String trendName, double changeValue) {
    analysis.logEvent(
      name: trendName,
      parameters: {
        'change': changeValue,
      },
    );
  }
}