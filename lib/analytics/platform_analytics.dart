import 'firebase_analytics_service.dart';

class PlatformAnalytics {
  final analysis = FirebaseAnalyticsService();

  /// Record app version
  /// [appVersion] adalah versi aplikasi
  /// Contoh penggunaan:
  /// recordAppVersion('1.0.0');
  void recordAppVersion(String appVersion) {
    analysis
        .logEvent(name: 'app_version', parameters: {'version': appVersion});
  }

  /// Record device type
  /// [deviceType] adalah tipe perangkat
  /// Contoh penggunaan:
  /// recordDeviceType('mobile');
  void recordDeviceType(String deviceType) {
    analysis
        .logEvent(name: 'device_type', parameters: {'type': deviceType});
  }

  /// Record device model
  /// [model] adalah model perangkat
  /// Contoh penggunaan:
  /// recordDeviceModel('Samsung Galaxy S21');
  void recordDeviceModel(String model) {
    analysis
        .logEvent(name: 'device_model', parameters: {'model': model});
  }

  /// Record device manufacture
  /// [manufacturer] adalah manufaktur perangkat
  /// Contoh penggunaan:
  /// recordDeviceManufacture('Samsung');
  void recordDeviceManufacture(String manufacturer) {
    analysis.logEvent(
        name: 'device_manufacturer',
        parameters: {'manufacturer': manufacturer});
  }
}
