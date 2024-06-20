import 'firebase_analytics_service.dart';

class UserAnalytics {
  final analysis = FirebaseAnalyticsService();
  

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
}
