import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../firebase_options.dart';
import 'application_performance_analytics.dart';
import 'conversion_analytics.dart';
import 'custom_event_analytics.dart';
import 'feature_usage_analytics.dart';
import 'analytics_engine_service.dart';
import 'marketing_retention_analytics.dart';
import 'platform_analytics.dart';
import 'trend_analysis_analytics.dart';
import 'user_analytics.dart';
import 'user_behavior_analytics.dart';

/// kelas ini berfungsi untuk mengirimkan data ke analytic
/// kami menggunakan firebase analytic untuk monitoring data
/// didalam kelas ini terdapat fungsi untuk mengirimkan data ke analytic
class AnalyticIO {
  static final AnalyticIO _instance = AnalyticIO._init();

  static final AnalyticsEngineService _analyticsService = AnalyticsEngineService();

  static var observers =
      FirebaseAnalyticsObserver(analytics: AnalyticsEngineService.instance);

  static final RouteObserver<ModalRoute<void>> routeObserver =
  RouteObserver<ModalRoute<void>>();

  static AnalyticIO get instance => _instance;

  factory AnalyticIO() => _instance;
  AnalyticIO._init();

  static ApplicationPerformanceAnalytics performance =
      ApplicationPerformanceAnalytics();

  static ConversionAnalytics conversion = ConversionAnalytics();
  static CustomEventAnalytics customEvent = CustomEventAnalytics();
  static FeatureUsageAnalytics featureUsage = FeatureUsageAnalytics();

  static MarketingRetentionAnalytics marketingRetention =
      MarketingRetentionAnalytics();

  static PlatformAnalytics platform = PlatformAnalytics();

  static TrendAnalysisAnalytics trendAnalysis = TrendAnalysisAnalytics();

  static UserAnalytics user = UserAnalytics();

  static UserBehaviorAnalytics userBehavior = UserBehaviorAnalytics();

  static Future<void> initializeApp() async {
    try {
      // initialize firebase app
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      // set analytics collection enabled
      _analyticsService.setAnalyticsCollectionEnabled(enabled: true);

    } catch (e) {
      print('error initilizeApp $e');
    }
  }
}
