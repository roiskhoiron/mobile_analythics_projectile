import 'firebase_analytics_service.dart';

/// Class to manage custom event analytics
/// such as recording user registration @[recordCustomEvent]
/// Example of usage:
/// recordCustomEvent('UserRegistration', {'value': 1});
class CustomEventAnalytics {
  final analysis = FirebaseAnalyticsService();


  /// Record custom event
  /// [eventName] is the name of the event
  /// [eventData] is the data of the event
  /// Example of usage:
  /// recordCustomEvent('UserRegistration', {'value': 1});
  Future<void> recordCustomEvent(
      String eventName, Map<String, Object>? eventData) async {
    await analysis.logEvent(name: eventName, parameters: eventData);
  }
}
