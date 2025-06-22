class EnvConfig {

  static const String firebaseStorageBucketId = String.fromEnvironment('FIREBASE_STORAGE_BUCKET');


  static const String firebaseProjectId = String.fromEnvironment('FIREBASE_PROJECT_ID');
  static const String firebaseMessagingSenderId = String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');

  // Android specific
  static const String firebaseAndroidApiKey = String.fromEnvironment('FIREBASE_ANDROID_API_KEY');
  static const String firebaseAndroidAppId = String.fromEnvironment('FIREBASE_ANDROID_APP_ID');

  // iOS specific
  static const String firebaseIosApiKey = String.fromEnvironment('FIREBASE_IOS_API_KEY');
  static const String firebaseIosAppId = String.fromEnvironment('FIREBASE_IOS_APP_ID');
  static const String firebaseIosBundleId = String.fromEnvironment('FIREBASE_IOS_BUNDLE_ID');

  // macOS specific
  static const String firebaseMacOSApiKey = String.fromEnvironment('FIREBASE_MACOS_API_KEY');
  static const String firebaseMacOSAppId = String.fromEnvironment('FIREBASE_MACOS_APP_ID');
  static const String firebaseMacOSBundleId = String.fromEnvironment('FIREBASE_MACOS_BUNDLE_ID');

  // Web specific
  static const String firebaseMeasurementId = String.fromEnvironment('FIREBASE_MEASUREMENT_ID');
  static const String firebaseWebApiKey = String.fromEnvironment('FIREBASE_WEB_API_KEY');
  static const String firebaseWebAppId = String.fromEnvironment('FIREBASE_WEB_APP_ID');
  static const String firebaseWebAuthDomain = String.fromEnvironment('FIREBASE_AUTH_DOMAIN');

  static const String firebaseWindowsApiKey = String.fromEnvironment('FIREBASE_WINDOWS_API_KEY');
  static const String firebaseWindowsAppId = String.fromEnvironment('FIREBASE_WINDOWS_APP_ID');

  // Validation
  static bool get isAndroidConfigured =>
      firebaseAndroidApiKey.isNotEmpty &&
          firebaseAndroidAppId.isNotEmpty &&
          firebaseProjectId.isNotEmpty;

  static bool get isIosConfigured =>
      firebaseIosApiKey.isNotEmpty &&
          firebaseIosAppId.isNotEmpty &&
          firebaseIosBundleId.isNotEmpty &&
          firebaseProjectId.isNotEmpty;

  static bool get isMacOSConfigured =>
      firebaseMacOSApiKey.isNotEmpty &&
          firebaseMacOSAppId.isNotEmpty &&
          firebaseMacOSBundleId.isNotEmpty &&
          firebaseProjectId.isNotEmpty;

  static bool get isWebConfigured =>
      firebaseWebApiKey.isNotEmpty &&
          firebaseWebAppId.isNotEmpty &&
          firebaseProjectId.isNotEmpty;

  static bool get isWindowsConfigured =>
      firebaseWindowsApiKey.isNotEmpty &&
          firebaseWindowsAppId.isNotEmpty &&
          firebaseProjectId.isNotEmpty;
}