import 'firebase_analytics_service.dart';

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