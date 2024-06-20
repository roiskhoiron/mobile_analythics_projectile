import 'firebase_analytics_service.dart';

class PlatformAnalytics {
  final analysis = FirebaseAnalyticsService();
  
  void recordAppVersion(String appVersion) {
    analysis
        .logEvent(name: 'app_version', parameters: {'version': appVersion});
  }

  void recordDeviceType(String deviceType) {
    analysis
        .logEvent(name: 'device_type', parameters: {'type': deviceType});
  }

  void recordDeviceModel(String model) {
    analysis
        .logEvent(name: 'device_model', parameters: {'model': model});
  }

  void recordDeviceManufacture(String manufacturer) {
    analysis.logEvent(
        name: 'device_manufacturer',
        parameters: {'manufacturer': manufacturer});
  }
}
