import 'package:flutter/material.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashView(),
      );

    case AppRoutes.onboarding:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const OnboardingView(),
      );

    case AppRoutes.home:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const HomeView(),
      );

    case AppRoutes.radioPlayer:
      final params = settings.arguments as RadioPlayerParams;
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: RadioPlayer(params: params),
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

Route<dynamic> _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => viewToShow,
  );
}
