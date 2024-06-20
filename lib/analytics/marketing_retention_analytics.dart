
import 'firebase_analytics_service.dart';

class MarketingRetentionAnalytics {
  final analysis = FirebaseAnalyticsService();


  void recordUserSource(String userSource) {
    analysis.logEvent(
      name: 'user_source',
      parameters: {
        'source': userSource,
      },
    );
  }

  void recordRetentionRate(double retentionRate) {
    analysis.logEvent(
      name: 'retention_rate',
      parameters: {
        'rate': retentionRate,
      },
    );
  }

  void recordCampaignEffectiveness(String campaignName, double effectivenessScore) {
    analysis.logEvent(
      name: 'campaign_effectiveness',
      parameters: {
        'campaign': campaignName,
        'effectiveness': effectivenessScore,
      },
    );
  }

  void recordUserEngagement(double userEngagementScore) {
    analysis.logEvent(
      name: 'user_engagement',
      parameters: {
        'engagement': userEngagementScore,
      },
    );
  }

  void recordMarketingROI(String campaignName, double roi) {
    analysis.logEvent(
      name: 'marketing_roi',
      parameters: {
        'campaign': campaignName,
        'roi': roi,
      },
    );
  }
}