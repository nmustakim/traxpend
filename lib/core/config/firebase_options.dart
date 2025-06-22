import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'env_config.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macOS;
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for this platform.',
        );
    }
  }

  static FirebaseOptions get android {
    assert(EnvConfig.isAndroidConfigured, 'Android Firebase configuration is missing!');

    return FirebaseOptions(
      apiKey: EnvConfig.firebaseAndroidApiKey,
      appId: EnvConfig.firebaseAndroidAppId,
      messagingSenderId: EnvConfig.firebaseMessagingSenderId,
      projectId: EnvConfig.firebaseProjectId,
    );
  }

  static FirebaseOptions get ios {
    assert(EnvConfig.isIosConfigured, 'iOS Firebase configuration is missing!');

    return FirebaseOptions(
      apiKey: EnvConfig.firebaseIosApiKey,
      appId: EnvConfig.firebaseIosAppId,
      messagingSenderId: EnvConfig.firebaseMessagingSenderId,
      projectId: EnvConfig.firebaseProjectId,
      iosBundleId: EnvConfig.firebaseIosBundleId,
      storageBucket: EnvConfig.firebaseStorageBucketId
    );
  }
  static FirebaseOptions get macOS {
    assert(EnvConfig.isIosConfigured, 'macOS Firebase configuration is missing!');

    return FirebaseOptions(
      apiKey: EnvConfig.firebaseMacOSApiKey,
      appId: EnvConfig.firebaseMacOSAppId,
      messagingSenderId: EnvConfig.firebaseMessagingSenderId,
      projectId: EnvConfig.firebaseProjectId,
      storageBucket: EnvConfig.firebaseStorageBucketId,
      iosBundleId: EnvConfig.firebaseIosBundleId,
    );
  }

  static FirebaseOptions get web {
    assert(EnvConfig.isWebConfigured, 'Web Firebase configuration is missing!');

    return FirebaseOptions(
      apiKey: EnvConfig.firebaseWebApiKey,
      appId: EnvConfig.firebaseWebAppId,
      messagingSenderId: EnvConfig.firebaseMessagingSenderId,
      projectId: EnvConfig.firebaseProjectId,
      authDomain: EnvConfig.firebaseWebAuthDomain,
      storageBucket: EnvConfig.firebaseStorageBucketId,
      measurementId: EnvConfig.firebaseMeasurementId
    );
  }

  static FirebaseOptions get windows {
    assert(EnvConfig.isWebConfigured, 'Windows Firebase configuration is missing!');

    return FirebaseOptions(
        apiKey: EnvConfig.firebaseWindowsApiKey,
        appId: EnvConfig.firebaseWindowsAppId,
        messagingSenderId: EnvConfig.firebaseMessagingSenderId,
        projectId: EnvConfig.firebaseProjectId,
        authDomain: EnvConfig.firebaseWebAuthDomain,
        storageBucket: EnvConfig.firebaseStorageBucketId,
        measurementId: EnvConfig.firebaseMeasurementId
    );
  }
}