Analyst monitor : https://analytics.google.com/analytics/web/?authuser=0&hl=en#/p446870659/realtime/overview?params=_u.dateOption%3Dtoday%26_u..nav%3Dmaui

event report document : https://docs.google.com/spreadsheets/d/1C0Qe9JLLGmCtkQ7Do0qKdZktviqPGvG42Q0gUDNvArI/edit?usp=sharing

# Dokumentasi Analitik Aplikasi

Proyek ini mencakup berbagai kelas analitik yang dirancang untuk melacak dan menganalisis berbagai aspek performa dan penggunaan aplikasi. Berikut adalah ringkasan singkat dari masing-masing kelas:

1. **ApplicationPerformanceAnalytics** | Digunakan untuk menganalisis kinerja aplikasi, termasuk waktu respon, crash rate, dan berbagai metrik kinerja lainnya.
```dart
// Contoh penggunaan
ApplicationPerformanceAnalytics apa = ApplicationPerformanceAnalytics();
apa.recordResponseTime('/api/v1/users', 200, true);
apa.recordApplicationError('NullPointerError');
apa.recordPerformance(name: 'loadTime', datas: {'time': 200});
```
2. **ConversionAnalytics** | Digunakan untuk melacak konversi, seperti pembelian dalam aplikasi, pendaftaran, atau tindakan lainnya yang mengindikasikan keberhasilan tujuan tertentu.
```dart
// Contoh penggunaan
ConversionAnalytics ca = ConversionAnalytics();
ca.recordConversionEvent('Purchase', 1);
ca.recordConversionRate(0.5);
```
3. **CustomEventAnalytics** | Memungkinkan pelacakan peristiwa khusus yang tidak termasuk dalam peristiwa standar. Anda bisa mendefinisikan dan menganalisis peristiwa sesuai kebutuhan spesifik aplikasi.
```dart
// Contoh penggunaan
TrendAnalysisAnalytics taa = TrendAnalysisAnalytics();
taa.recordTrendEvent('UserRegistration', 1);
taa.recordTrendChange('UserRegistration', 0.5);
```
4. **FeatureUsageAnalytics** | Digunakan untuk menganalisis penggunaan fitur tertentu dalam aplikasi, membantu memahami fitur mana yang paling sering digunakan dan bagaimana pengguna berinteraksi dengan mereka.
```dart
// Contoh penggunaan
FeatureUsageAnalytics fua = FeatureUsageAnalytics();
fua.recordFeatureUsage('DarkMode', true);
fua.recordFeaturePreference('DarkMode', true);
```
5. **MarketingRetentionAnalytics** | Fokus pada analisis retensi pengguna dan efektivitas kampanye pemasaran. Ini bisa mencakup pelacakan churn rate dan engagement pengguna.
```dart
// Contoh penggunaan
MarketingRetentionAnalytics mra = MarketingRetentionAnalytics();
mra.recordUserEngagement(0.8);
mra.recordMarketingROI('WinterSale', 1.5);
mra.recordCampaignDuration('WinterSale', 3600);
mra.recordCampaignFrequency('WinterSale', 5);
```
6. **PlatformAnalytics** | Digunakan untuk menganalisis performa aplikasi di berbagai platform (misalnya iOS vs Android), termasuk perbedaan dalam penggunaan atau kinerja.
```dart
// Contoh penggunaan
PlatformAnalytics pa = PlatformAnalytics();
pa.recordAppVersion('1.0.0');
pa.recordDeviceType('mobile');
pa.recordDeviceModel('Samsung Galaxy S21');
pa.recordDeviceManufacture('Samsung');
```
7. **TrendAnalysisAnalytics** | Berfungsi untuk menganalisis tren data dari waktu ke waktu, membantu mengidentifikasi pola atau perubahan signifikan dalam perilaku pengguna.
```dart
// Contoh penggunaan
TrendAnalysisAnalytics taa = TrendAnalysisAnalytics();
taa.recordTrendEvent('UserRegistration', 1);
taa.recordTrendChange('UserRegistration', 0.5);
```
8. **UserAnalytics** | Mengelola dan menganalisis data pengguna secara umum, termasuk demografi, kebiasaan penggunaan, dan metrik lainnya yang terkait dengan basis pengguna.
```dart
// Contoh penggunaan
UserAnalytics ua = UserAnalytics(userID: '123', username: 'JohnDoe', email: 'johndoe@example.com');
ua.recordUserInformation();
ua.updateUser(email: 'johndoe@example.com', userID: '123', username: 'JohnDoe');
ua.recordUserActivity('Login', 1);
ua.recordUserSession(3600);
```
9. **UserBehaviorAnalytics** | Fokus pada analisis perilaku pengguna, seperti alur penggunaan, preferensi, dan interaksi dalam aplikasi.
```dart
// Contoh penggunaan
UserBehaviorAnalytics uba = UserBehaviorAnalytics();
uba.recordUserBehavior('Login', 1);
uba.recordUserPreference('DarkMode', true);
```
Dengan memetakan analisa data berdasarkan kategori seperti ini, Anda bisa lebih mudah mengelola dan memahami data yang dikumpulkan, serta membuat keputusan berdasarkan analisis yang lebih terstruktur dan mendalam. Pastikan setiap file memiliki fungsi yang jelas dan terintegrasi dengan baik satu sama lain untuk mendapatkan gambaran lengkap tentang kinerja dan penggunaan aplikasi Anda.

# Additional Utils
### Object Tracker Recorder

`ObjectTrackerRecorder` adalah kelas yang digunakan untuk merekam durasi suatu aktivitas. Kelas ini menyediakan metode `start()` untuk memulai pencatatan waktu dan `stop()` untuk menghentikan pencatatan waktu. Durasi total aktivitas dihitung saat metode `stop()` dipanggil.

### Penggunaan

Berikut adalah contoh penggunaan `ObjectTrackerRecorder` pada  `UserBehaviorAnalytics` untuk merekam durasi aktivitas pengguna tertentu seperti 'App Start' atau 'Login':

```dart
// Membuat instance UserBehaviorAnalytics
UserBehaviorAnalytics uba = UserBehaviorAnalytics();

// Memulai pencatatan waktu untuk aktivitas 'App Start'
uba.recordUserActivity('App Start').start();

// Lakukan aktivitas yang ingin dicatat waktunya
await Future<void>.delayed(const Duration(seconds: 2));

// Setelah beberapa waktu, menghentikan pencatatan waktu
uba.recordUserActivity('App Start').stop();
```

Terdapat penyesuaian ulang penulisan code user_behavior_analytics.dart pada fungsi `recordUserActivity`
```dart
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
```

# Capture Documentation:

![image](https://github.com/roiskhoiron/mobile_analythics_projectile/assets/28525341/23aeb8cd-c363-43fc-a6fc-92b4f3afde86)


<img width="1158" alt="image" src="https://github.com/roiskhoiron/mobile_analythics_projectile/assets/28525341/50248d50-3955-49db-9157-4b7b0e9d7fec">

<img width="1170" alt="image" src="https://github.com/roiskhoiron/mobile_analythics_projectile/assets/28525341/6762592b-0ac3-4f0c-b6e0-a864b3930398">


### next challenge follow this link:
bigquery : https://cloud.google.com/blog/products/management-tools/using-bigquery-and-firebase-analytics-to-understand-your-mobile-app

