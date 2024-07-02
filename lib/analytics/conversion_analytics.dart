import 'analytics_engine_service.dart';

/// Class untuk mengelola analitik konversi
/// seperti merekam event konversi @[recordConversionEvent],
/// dan merekam tingkat konversi @[recordConversionRate]
/// Contoh penggunaan:
/// recordConversionEvent('Purchase', 1);
/// recordConversionRate(0.5);
class ConversionAnalytics {
  final analysis = AnalyticsEngineService();

  /// Catat event konversi
  /// [eventName] adalah nama event
  /// [eventValue] adalah nilai event
  /// Contoh penggunaan:
  /// recordConversionEvent('Purchase', 1);
  void recordConversionEvent(String eventName, int eventValue) {
    analysis.logEvent(
      name: eventName,
      parameters: {
        'value': eventValue,
      },
    );
  }

  /// Catat tingkat konversi
  /// [conversionRate] adalah tingkat konversi
  /// Contoh penggunaan:
  /// recordConversionRate(0.5);
  void recordConversionRate(double conversionRate) {
    analysis.logEvent(
      name: 'conversion_rate',
      parameters: {
        'rate': conversionRate,
      },
    );
  }
}