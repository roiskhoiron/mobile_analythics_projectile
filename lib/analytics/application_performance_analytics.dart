import 'analytics_engine_service.dart';

/// Class untuk mengelola analitik performa aplikasi
/// seperti merekam waktu respons API @[recordResponseTime],
/// merekam error aplikasi @[recordApplicationError],
/// dan merekam performa aplikasi @[recordPerformance]
/// Contoh penggunaan:
/// recordResponseTime('/api/v1/users', 200, true);
/// recordApplicationError('NullPointerError');
/// recordPerformance(name: 'loadTime', datas: {'time': 200});
class ApplicationPerformanceAnalytics {
  final analysis = AnalyticsEngineService();

  /// Catat waktu respons
  /// [apiEndpoint] adalah endpoint API yang dipanggil
  /// [responseTime] adalah waktu respons dalam milidetik
  /// [success] menunjukkan apakah panggilan API berhasil atau tidak
  /// Contoh penggunaan:
  /// recordResponseTime('/api/v1/users', 200, true);
  static void recordResponseTime(
      String apiEndpoint, int responseTime, bool success) {
    // Record response time
  }

  /// Catat error aplikasi
  /// [errorMessage] adalah pesan error
  /// Contoh penggunaan:
  /// recordApplicationError('NullPointerError');
  static void recordApplicationError(String errorMessage) {
    // Record application error
  }

  /// Catat performa
  /// [name] adalah nama event
  /// [datas] adalah data yang akan dicatat
  /// Contoh penggunaan:
  /// recordPerformance(name: 'loadTime', datas: {'time': 200});
  void recordPerformance(
      {required String name, required Map<String, Object> datas}) {
    analysis.logEvent(
      name: name,
      parameters: datas,
    );
  }
}