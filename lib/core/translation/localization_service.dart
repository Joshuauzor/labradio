import 'package:labradio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  static AppLocalizations? _instance;

  static AppLocalizations? get instance => _instance;

  static void setLocale(BuildContext context) {
    _instance = AppLocalizations.of(context);
  }
}
