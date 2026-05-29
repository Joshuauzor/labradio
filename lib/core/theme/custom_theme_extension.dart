import 'package:flutter/material.dart';

@immutable
class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  const CustomThemeColors({
    required this.deactivatedPrimary,
    required this.fill,
    required this.switchOutline,
    required this.purpleBasicText,
    required this.notch,
    required this.alternativeHint,
    required this.matteWool,
    required this.paleGold,
    required this.success,
    required this.cardAlt,
    required this.red,
    required this.cardSecondary,
    required this.cardAltSecondary,
  });
  final Color? deactivatedPrimary;
  final Color? switchOutline;
  final Color? fill;
  final Color? purpleBasicText;
  final Color? notch;
  final Color? alternativeHint;
  final Color? matteWool;
  final Color? paleGold;
  final Color? success;
  final Color? cardAlt;
  final Color? red;
  final Color? cardSecondary;
  final Color? cardAltSecondary;
  @override
  CustomThemeColors copyWith({Color? customRed, Color? brandGreen}) {
    return CustomThemeColors(
      deactivatedPrimary: deactivatedPrimary ?? deactivatedPrimary,
      switchOutline: switchOutline ?? switchOutline,
      fill: fill ?? fill,
      purpleBasicText: purpleBasicText ?? purpleBasicText,
      notch: notch ?? notch,
      alternativeHint: alternativeHint ?? alternativeHint,
      matteWool: matteWool ?? matteWool,
      paleGold: paleGold ?? paleGold,
      success: success ?? success,
      cardAlt: cardAlt ?? cardAlt,
      red: red ?? red,
      cardSecondary: cardSecondary ?? cardSecondary,
      cardAltSecondary: cardAltSecondary ?? cardAltSecondary,
    );
  }

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) return this;
    return CustomThemeColors(
      deactivatedPrimary: Color.lerp(
        deactivatedPrimary,
        other.deactivatedPrimary,
        t,
      ),
      switchOutline: Color.lerp(
        deactivatedPrimary,
        other.deactivatedPrimary,
        t,
      ),
      fill: Color.lerp(deactivatedPrimary, other.deactivatedPrimary, t),
      purpleBasicText: Color.lerp(purpleBasicText, other.purpleBasicText, t),
      notch: Color.lerp(notch, other.notch, t),
      alternativeHint: Color.lerp(alternativeHint, other.alternativeHint, t),
      matteWool: Color.lerp(matteWool, other.matteWool, t),
      paleGold: Color.lerp(paleGold, other.paleGold, t),
      success: Color.lerp(success, other.success, t),
      cardAlt: Color.lerp(cardAlt, other.cardAlt, t),
      red: Color.lerp(red, other.red, t),
      cardSecondary: Color.lerp(cardSecondary, other.cardSecondary, t),
      cardAltSecondary: Color.lerp(cardAltSecondary, other.cardAltSecondary, t),
    );
  }
}
