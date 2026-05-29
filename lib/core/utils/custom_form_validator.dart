import 'package:flutter/material.dart';
import 'package:labradio/core/core.dart';

class CustomFormValidation {
  static Color getColor(
    String? text,
    FocusNode focus,
    String? validationError,
    BuildContext context,
  ) {
    if (focus.hasFocus && text == null) {
      return AppColors.error;
    } else if (focus.hasFocus &&
        text!.isEmpty &&
        validationError != null &&
        validationError.isNotEmpty) {
      return AppColors.error;
    } else if (focus.hasFocus &&
        text!.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primary;
    } else if (text != null &&
        text.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primary;
    } else if (validationError != null && validationError.isNotEmpty) {
      return AppColors.error;
    } else {
      return Theme.of(context).disabledColor;
    }
  }

  static String errorEmailMessage(
    String? text,
    String message, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (EmailValidator.validEmail(text) == false) {
      return 'Email must be a valid email address';
    } else {
      return '';
    }
  }

  static String errorMessage(String? text, String message, [String? type]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }

  static String errorMessagePhoneNumber(
    String? text,
    String message, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      // Extract digits after the '+'
      final digits = text.substring(1).replaceAll(RegExp(r'[^\d]'), '');
      if (digits.length <= 5 || digits.length >= 10) {
        return 'Phone number must have more than 5 digits and less than 10 digits';
      } else {
        return '';
      }
    }
  }

  static String errorMessageLength(
    String? text,
    String message, {
    required num textLength,
    String? type,
  }) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length > textLength) {
      return 'characters limit reached';
    } else {
      return '';
    }
  }

  static String errorMessageUrl(String? text, String message, [String? type]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      try {
        // Parse the URL and check if it is valid
        final uri = Uri.parse(text);

        // Check if the URL is absolute (contains scheme and host)
        if (!uri.isAbsolute || uri.host.isEmpty) {
          return 'Invalid URL'; // Invalid URL
        }

        // Additional validation: Ensure the URL starts with http or https
        if (!(uri.scheme == 'http' || uri.scheme == 'https')) {
          return 'URL must start with http or https.';
        }

        // Check if the URL ends with a valid domain extension
        final validDomainExtension = RegExp(r'\.[a-zA-Z]{2,}$');
        if (!validDomainExtension.hasMatch(uri.host)) {
          return 'URL must end with a valid domain extension (e.g., .com, .org).';
        }

        return ''; // Valid URL
      } on Exception catch (_) {
        // Catch any parsing errors and return an invalid URL message
        return 'Invalid URL';
      }
    }
  }

  static String errorMessagePasswordCreation(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasUpperCase = RegExp('(?:[A-Z])');
    final hasLowerCase = RegExp('(?:[a-z])');
    final hasSymbols = RegExp(r"[!@#$%^&*(),\|+=;.?':{}|<>]");
    final hasANumber = RegExp('(?=.*?[0-9])');

    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 5) {
      return 'Password is too short';
    } else if (!hasANumber.hasMatch(text)) {
      return 'Password must have at least one number';
    } else if (!hasLowerCase.hasMatch(text)) {
      return 'Password must have a lowercase character';
    } else if (!hasSymbols.hasMatch(text)) {
      return 'Password must have a special character e.g (! @ #)';
    } else if (!hasUpperCase.hasMatch(text)) {
      return 'Password must have a uppercase character';
    } else {
      return '';
    }
  }

  static String errorMessagePassword(
    String? text,
    String message, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length < 5) {
      return 'Password must be 5 or more characters';
    } else {
      return '';
    }
  }

  static String errorMessageConfirmPassword(
    String? text,
    String message,
    String password, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 4) {
      return 'Password must be 5 or more characters';
    } else if (text != password) {
      return 'Confirmation password must match the password';
    } else {
      return '';
    }
  }

  static String errorMessageConfirmMatch(
    String? text,
    String message,
    String phoneNumber, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text != phoneNumber) {
      return 'Confirmation phone number must match the phone number';
    } else {
      return '';
    }
  }

  static String errorMessageOtp(String? text, String message, [String? type]) {
    final hasANumber = RegExp('(?=.*?[0-9])');
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 4) {
      return 'OTP must be 4 characters';
    } else if (!hasANumber.hasMatch(text)) {
      return 'OTP must be a number';
    } else {
      return '';
    }
  }

  static String errorMessageOtpSix(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasANumber = RegExp('(?=.*?[0-9])');
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 6) {
      return 'OTP must have 6 characters';
    } else if (!hasANumber.hasMatch(text)) {
      return 'OTP must be a number';
    } else {
      return '';
    }
  }

  static String errorMessageUserName(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasSpace = RegExp('[^A-Za-z0-9_]');
    if (text == null) {
      return '';
    }
    if (hasSpace.hasMatch(text)) {
      return 'Username can contain only letters, numbers and underscores.';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }
}
