import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static FirebaseAnalytics get instance => _analytics;

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
    print('ANALYTIC.IO [logEvent]: $name succeeded');
  }

  Future<void> setUserProperties({
    required String name,
    required String value,
  }) async {
    await _analytics.setUserProperty(
      name: name,
      value: value,
    );
    print('ANALYTIC.IO [setUserProperties]: $name succeeded');
  }

  Future<void> setScreenView({
    required String screenName,
  }) async {
    await _analytics.logScreenView(screenName: screenName);
    print('ANALYTIC.IO [setScreenView]: $screenName succeeded');
  }

  Future<void> setCurrentScreen({
    required String screenName,
    required String screenClassOverride,
  }) async {
    await _analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenClassOverride,
    );
    print('ANALYTIC.IO [setCurrentScreen]: $screenName succeeded');
  }

  Future<void> setUserId({
    String? id,
  }) async {
    await _analytics.setUserId(id: id);
    print('ANALYTIC.IO [setUserId]: $id succeeded');
  }

  Future<void> setAnalyticsCollectionEnabled({
    required bool enabled,
  }) async {
    await _analytics.setAnalyticsCollectionEnabled(enabled);
    print('ANALYTIC.IO [setAnalyticsCollectionEnabled]: $enabled succeeded');
  }

  Future<void> setSessionTimeoutDuration({
    required Duration milliseconds,
  }) async {
    await _analytics.setSessionTimeoutDuration(milliseconds);
    print('ANALYTIC.IO [setSessionTimeoutDuration]: $milliseconds succeeded');
  }
}
