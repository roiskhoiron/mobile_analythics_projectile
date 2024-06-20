import 'firebase_analytics_service.dart';

/// Class untuk mengelola analitik retensi pemasaran
/// seperti merekam sumber pengguna @[recordUserSource],
/// merekam tingkat retensi @[recordRetentionRate],
/// merekam efektivitas kampanye @[recordCampaignEffectiveness],
/// merekam tingkat keterlibatan pengguna @[recordUserEngagement],
/// merekam ROI pemasaran @[recordMarketingROI],
/// merekam durasi kampanye pemasaran @[recordCampaignDuration],
/// dan merekam frekuensi kampanye pemasaran @[recordCampaignFrequency]
/// Contoh penggunaan:
/// recordUserSource('GoogleAds');
/// recordRetentionRate(0.85);
/// recordCampaignEffectiveness('WinterSale', 0.75);
/// recordUserEngagement(0.9);
/// recordMarketingROI('WinterSale', 1.5);
/// recordCampaignDuration('WinterSale', 3600);
/// recordCampaignFrequency('WinterSale', 5);
class MarketingRetentionAnalytics {
  final analysis = FirebaseAnalyticsService();

  /// Catat sumber pengguna
  /// [userSource] adalah sumber pengguna
  /// Contoh penggunaan:
  /// recordUserSource('GoogleAds');
  void recordUserSource(String userSource) {
    analysis.logEvent(
      name: 'user_source',
      parameters: {
        'source': userSource,
      },
    );
  }

  /// Catat tingkat retensi
  /// [retentionRate] adalah tingkat retensi
  /// Contoh penggunaan:
  /// recordRetentionRate(0.85);
  void recordRetentionRate(double retentionRate) {
    analysis.logEvent(
      name: 'retention_rate',
      parameters: {
        'rate': retentionRate,
      },
    );
  }

  /// Catat efektivitas kampanye
  /// [campaignName] adalah nama kampanye
  /// [effectivenessScore] adalah skor efektivitas kampanye
  /// Contoh penggunaan:
  /// recordCampaignEffectiveness('WinterSale', 0.75);
  void recordCampaignEffectiveness(String campaignName, double effectivenessScore) {
    analysis.logEvent(
      name: 'campaign_effectiveness',
      parameters: {
        'campaign': campaignName,
        'effectiveness': effectivenessScore,
      },
    );
  }

  /// Catat tingkat keterlibatan pengguna
  /// [userEngagementScore] adalah skor keterlibatan pengguna
  /// Contoh penggunaan:
  /// recordUserEngagement(0.9);
  void recordUserEngagement(double userEngagementScore) {
    analysis.logEvent(
      name: 'user_engagement',
      parameters: {
        'engagement': userEngagementScore,
      },
    );
  }

  /// Catat ROI pemasaran
  /// [campaignName] adalah nama kampanye
  /// [roi] adalah ROI pemasaran
  /// Contoh penggunaan:
  /// recordMarketingROI('WinterSale', 1.5);
  void recordMarketingROI(String campaignName, double roi) {
    analysis.logEvent(
      name: 'marketing_roi',
      parameters: {
        'campaign': campaignName,
        'roi': roi,
      },
    );
  }

  /// Catat durasi kampanye pemasaran
  /// [campaignName] adalah nama kampanye
  /// [duration] adalah durasi kampanye dalam detik
  /// Contoh penggunaan:
  /// recordCampaignDuration('WinterSale', 3600);
  void recordCampaignDuration(String campaignName, int duration) {
    analysis.logEvent(
      name: 'campaign_duration',
      parameters: {
        'campaign': campaignName,
        'duration': duration,
      },
    );
  }

  /// Catat frekuensi kampanye pemasaran
  /// [campaignName] adalah nama kampanye
  /// [frequency] adalah frekuensi kampanye
  /// Contoh penggunaan:
  /// recordCampaignFrequency('WinterSale', 5);
  void recordCampaignFrequency(String campaignName, int frequency) {
    analysis.logEvent(
      name: 'campaign_frequency',
      parameters: {
        'campaign': campaignName,
        'frequency': frequency,
      },
    );
  }
}