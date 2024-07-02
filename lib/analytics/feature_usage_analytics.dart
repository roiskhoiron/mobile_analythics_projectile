import 'analytics_engine_service.dart';

/// Class untuk mengelola analitik pengguna
/// seperti merekam durasi penggunaan fitur @[recordFeatureDuration],
/// dan merekam frekuensi penggunaan fitur @[recordFeatureFrequency]
/// Contoh penggunaan:
/// recordFeatureDuration('SearchFeature', 60);
/// recordFeatureFrequency('SearchFeature', 10);
class FeatureUsageAnalytics {
  final analysis = AnalyticsEngineService();

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