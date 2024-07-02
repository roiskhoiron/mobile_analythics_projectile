import 'analytics_engine_service.dart';
import 'object_tracker_recorder.dart';

/// Class untuk mengelola analitik perilaku pengguna
/// seperti merekam navigasi layar @[recordScreenNavigation],
/// merekam aktivitas pengguna @[recordUserActivity],
/// dan merekam interaksi pengguna @[recordUserInteraction]
/// Contoh penggunaan:
/// recordScreenNavigation('HomeScreen');
/// recordUserActivity('PlayingGame', 120);
/// recordUserInteraction('ButtonPress', 5);
class UserBehaviorAnalytics {
  final analysis = AnalyticsEngineService();

  final Map<String, ObjectTrackerRecorder> _activityTrackers = {};

  /// Catat navigasi layar
  /// [screenName] adalah nama layar
  /// Contoh penggunaan:
  /// recordScreenNavigation('HomeScreen');
  void recordScreenNavigation(String screenName, Map<String, Object>? parameters) {
    analysis.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
      parameters: parameters,
    );
  }

  ObjectTrackerRecorder recordUserActivity(String activityName) {
    if (!_activityTrackers.containsKey(activityName)) {
      _activityTrackers[activityName] = ObjectTrackerRecorder(activityName)
        ..onStop((int duration) {
          analysis.logEvent(
            name: 'user_activity',
            parameters: {
              'activity': activityName,
              'duration': duration,
            },
          );

          // Hapus tracker setelah selesai
          _activityTrackers.remove(activityName);
        });
    }

    return _activityTrackers[activityName]!;
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