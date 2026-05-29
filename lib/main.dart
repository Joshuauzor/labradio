import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:labradio/app.dart';
import 'package:labradio/bootstrap.dart';
import 'package:labradio/core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
  const environment = kReleaseMode ? '.env.production' : '.env.development';
  await Future.wait([
    dotenv.load(fileName: environment),

    /// Initializing the firebase app.
    Firebase.initializeApp(),

    /// Create Android 8.0+ notifications channel
    App.flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.createNotificationChannel(App.androidChannel) ??
        Future<void>.value(),
  ]);

  // // // Sets push notifications to display background message handler.
  // FirebaseMessaging.onBackgroundMessage(_showNotification);

  // Record errors to firebase crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    // load the preferred theme mode of the app

    await bootstrap(
      () => DevicePreview(
        // It's redundant but improves readability.
        // ignore: avoid_redundant_argument_values
        enabled: !kReleaseMode,
        builder: (context) => const App(),
      ),
    );
  });
}

// Background message handler
// @pragma('vm:entry-point')
// Future<void> _showNotification(RemoteMessage message) async {
//   Logger().d('Notification came in');
//   await Firebase.initializeApp();
//   if (message.notification?.title != null) {}
// }
