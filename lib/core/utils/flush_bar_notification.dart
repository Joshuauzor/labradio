import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labradio/core/core.dart';

class FlushBarNotification {
  static Future<void> showError({
    required BuildContext context,
    required String message,
  }) {
    return Flushbar<dynamic>(
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      message: message,
      messageColor: Theme.of(context).textTheme.bodyMedium?.color,
      duration: const Duration(seconds: 4),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(8),
      icon: SvgPicture.asset(AppAssets.error, width: 24, height: 24),
    ).show(context);
  }

  static Future<void> showSuccess({
    required BuildContext context,
    required String message,
  }) {
    return Flushbar<dynamic>(
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      message: message,
      messageColor: Theme.of(context).textTheme.bodyMedium?.color,
      duration: const Duration(seconds: 4),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(8),
      icon: SvgPicture.asset(AppAssets.success, width: 24, height: 24),
    ).show(context);
  }

  static Future<void> showInfo({
    required BuildContext context,
    required String message,
    String? title,
    void Function(Flushbar<dynamic>)? onTap,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
  }) {
    return Flushbar<dynamic>(
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      title: title,
      message: message,
      messageColor: Theme.of(context).textTheme.bodyMedium?.color,
      duration: duration,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(8),
      icon: icon ?? SvgPicture.asset(AppAssets.info, width: 24, height: 24),
      onTap: onTap,
    ).show(context);
  }
}
