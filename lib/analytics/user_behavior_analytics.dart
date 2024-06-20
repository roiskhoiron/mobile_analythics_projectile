import 'firebase_analytics_service.dart';

/// Class untuk mengelola analitik perilaku pengguna
/// seperti merekam navigasi layar @[recordScreenNavigation],
/// merekam aktivitas pengguna @[recordUserActivity],
/// dan merekam interaksi pengguna @[recordUserInteraction]
/// Contoh penggunaan:
/// recordScreenNavigation('HomeScreen');
/// recordUserActivity('PlayingGame', 120);
/// recordUserInteraction('ButtonPress', 5);
class UserBehaviorAnalytics {
  final analysis = FirebaseAnalyticsService();

  /// Catat navigasi layar
  /// [screenName] adalah nama layar
  /// Contoh penggunaan:
  /// recordScreenNavigation('HomeScreen');
  void recordScreenNavigation(String screenName) {
    analysis.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
    );
    analysis.setScreenView(screenName: screenName);
  }

  /// Catat aktivitas pengguna
  /// [activityName] adalah nama aktivitas
  /// [duration] adalah durasi aktivitas dalam detik
  /// Contoh penggunaan:
  /// recordUserActivity('PlayingGame', 120);
  void recordUserActivity(String activityName, int duration) {
    analysis.logEvent(
      name: 'user_activity',
      parameters: {
        'activity': activityName,
        'duration': duration,
      },
    );
  }

  /// Catat interaksi pengguna
  /// [interactionType] adalah jenis interaksi
  /// [interactionCount] adalah jumlah interaksi
  /// Contoh penggunaan:
  /// recordUserInteraction('ButtonPress', 5);
  void recordUserInteraction(String interactionType, int interactionCount) {
    analysis.logEvent(
      name: 'user_interaction',
      parameters: {
        'interaction': interactionType,
        'count': interactionCount,
      },
    );
  }
}