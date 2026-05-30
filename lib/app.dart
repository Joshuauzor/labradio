import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';
import 'package:labradio/l10n/app_localizations.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
// declare custom used to nav across all parts of the app
final customNav = Navigator.of(navKey.currentState!.context);
final currentLocale = Localizations.localeOf(navKey.currentState!.context);

class App extends StatefulWidget {
  const App({super.key});

  static const androidChannel = AndroidNotificationChannel(
    'cliqmit_notification_channel',
    'High Importance Notifications',
    importance: Importance.high,
    description: 'Default notification channel',
    enableLights: true,
  );

  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // initialize firebase push notification
    WidgetsBinding.instance.addObserver(this);

    // Remove native splash screen after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    // final brightness =
    //     WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExploreStationsCubit>(
          create: (context) => ExploreStationsCubit(
            getStationsUseCase: sl<GetStationsUseCase>(),
            addToFavoritesUseCase: sl<AddToFavoritesUseCase>(),
            removeFromFavoritesUseCase: sl<RemoveFromFavoritesUseCase>(),
          )..getStations(skip: 0),
        ),
        BlocProvider<RadioPlayerCubit>(
          create: (context) => RadioPlayerCubit(
            audioController: sl<AudioController>(),
            analytics: sl<GoogleAnalytics>(),
          ),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(
            getFavoriteStationsUseCase: sl<GetFavoriteStationsUseCase>(),
            removeFromFavoritesUseCase: sl<RemoveFromFavoritesUseCase>(),
          )..getFavoriteStations(skip: 0),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            builder: (context, child) {
              // Initialize localization service globally
              LocalizationService.setLocale(context);
              return DevicePreview.appBuilder(context, child);
            },
            onGenerateRoute: generateRoute,
            navigatorKey: navKey,
            navigatorObservers: [appRouteObserver],
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale('en'), Locale('es')],
            themeMode: ThemeMode.system,
            darkTheme: darkTheme,
            theme: lightTheme,
            initialRoute: AppRoutes.splash,
          );
        },
      ),
    );
  }
}
