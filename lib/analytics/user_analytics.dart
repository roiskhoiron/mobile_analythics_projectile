import 'analytics_engine_service.dart';

/// Class untuk mengelola analitik pengguna
/// seperti merekam informasi pengguna @[recordUserInformation],
/// mengupdate informasi pengguna @[updateUser],
/// dan merekam sesi pengguna @[recordUserSession]
/// Contoh penggunaan:
/// recordUserInformation();
/// updateUser(email: '', userID: '', username: '');
/// recordUserSession(3600);
class UserAnalytics {
  final analysis = AnalyticsEngineService();
  

  /// @[defaultValue] is data that will be sent to analytic if the user out of login
  static const defaultValue = 'default';
  final String userID;
  final String username;
  final String email;

  UserAnalytics({
    this.userID = defaultValue,
    this.username = defaultValue,
    this.email = defaultValue,
  });

  /// Catat informasi pengguna
  /// Contoh penggunaan:
  /// recordUserInformation();
  void recordUserInformation() {
    analysis.logEvent(
      name: 'user_information_recorded',
      parameters: {
        'user_id': userID,
        'username': username,
        'email': email,
      },
    );
  }

  /// Update informasi pengguna
  /// [email] adalah email pengguna
  /// [userID] adalah id pengguna
  /// [username] adalah nama pengguna
  /// Contoh penggunaan:
  /// updateUser(email: '', userID: '', username: '');
  void updateUser(
      {required email, required String userID, required String username}) {
    analysis.logEvent(
      name: 'user_information_updated',
      parameters: {
        'user_id': userID,
        'username': username,
        'email': email,
      },
    );

    analysis.setUserId(id: userID);

    analysis.setUserProperties(name: 'username', value: username);
  }

  /// Catat sesi pengguna
  /// [sessionDuration] adalah durasi sesi dalam detik
  /// Contoh penggunaan:
  /// recordUserSession(3600);
  void recordUserSession(int sessionDuration) {
    analysis.logEvent(
      name: 'user_session',
      parameters: {
        'duration': sessionDuration,
      },
    );
  }
}
