import 'firebase_analytics_service.dart';

class FeatureUsageAnalytics {
  final analysis = FirebaseAnalyticsService();

  /// Catat durasi penggunaan fitur
  /// [featureName] adalah nama fitur
  /// [duration] adalah durasi penggunaan fitur dalam detik
  /// Contoh penggunaan:
  /// recordFeatureDuration('SearchFeature', 60);
  void recordFeatureDuration(String featureName, int duration) {
    analysis.logEvent(
      name: 'feature_duration',
      parameters: {
        'feature': featureName,
        'duration': duration,
      },
    );
  }

  /// Catat frekuensi penggunaan fitur
  /// [featureName] adalah nama fitur
  /// [frequency] adalah frekuensi penggunaan fitur
  /// Contoh penggunaan:
  /// recordFeatureFrequency('SearchFeature', 10);
  void recordFeatureFrequency(String featureName, int frequency) {
    analysis.logEvent(
      name: 'feature_frequency',
      parameters: {
        'feature': featureName,
        'frequency': frequency,
      },
    );
  }
}