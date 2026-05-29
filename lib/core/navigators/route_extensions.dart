import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static Route<T> material<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute<T>(
      settings: settings,
      builder: builder,
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> platform<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute<T>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullscreenDialog,
      );
    } else {
      return MaterialPageRoute<T>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullscreenDialog,
      );
    }
  }

  static Route<T> withoutAnimation<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionDuration: Duration.zero,
    );
  }

  static Route<T> fade<T>({
    required RouteSettings settings,
    required WidgetBuilder builder,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  /// Scale: page zooms in from center.
  static Route<T> scale<T>({
    required RouteSettings settings,
    required WidgetBuilder builder,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation.drive(
            Tween<double>(
              begin: 0,
              end: 1,
            ).chain(CurveTween(curve: Curves.easeOut)),
          ),
          child: child,
        );
      },
    );
  }

  /// Fade + scale: modal-style entrance.
  static Route<T> scaleAndFade<T>({
    required RouteSettings settings,
    required WidgetBuilder builder,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: curved.drive(Tween<double>(begin: 0.9, end: 1)),
            child: child,
          ),
        );
      },
    );
  }

  /// Slide from left (e.g. back navigation).
  static Route<T> slideFromLeft<T>({
    required RouteSettings settings,
    required WidgetBuilder builder,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1, 0);
        const end = Offset.zero;
        final offsetAnimation = animation.drive(
          Tween<Offset>(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.easeOutCubic)),
        );
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static Route<T> slide<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static Route<T> slideUp<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static Route<T> dialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    required RouteSettings settings,
    CapturedThemes? themes,
    Color? barrierColor = Colors.black54,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool useSafeArea = true,
  }) {
    return DialogRoute<T>(
      context: context,
      builder: builder,
      themes: themes,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      settings: settings,
      useSafeArea: useSafeArea,
    );
  }
}
