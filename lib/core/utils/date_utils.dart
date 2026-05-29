import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:labradio/app.dart';

class DateHelper {
  // helper method to convert UTC to local time
  static DateTime toLocalTime(DateTime utcTime) {
    return utcTime.toLocal();
  }

  // helper method to convert local time to UTC
  static DateTime toUtcTime(DateTime localTime) {
    return localTime.toUtc();
  }

  static String shortFormatDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    final localTime = toLocalTime(dateTime);
    return DateFormat.yMMMd(currentLocale.languageCode).format(localTime);
  }

  static String shortFormatDateAndTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    final localTime = toLocalTime(dateTime);
    return '${DateFormat.yMMMd(currentLocale.languageCode).format(localTime)}, ${time12Format(dateTime)}';
  }

  static String monthYearFormatDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    final localTime = toLocalTime(dateTime);
    return DateFormat.yMMMM(currentLocale.languageCode).format(localTime);
  }

  static String dayAndDateFormat(DateTime? dateTime) {
    if (dateTime == null) return '';
    final localTime = toLocalTime(dateTime);
    return DateFormat('EEEE d', currentLocale.languageCode).format(localTime);
  }

  static String longFormatDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    final localTime = toLocalTime(dateTime);
    return DateFormat.yMMMMd(currentLocale.languageCode).format(localTime);
  }

  static String timeFormat(DateTime? dateTime) {
    if (dateTime == null) return '';
    final localTime = toLocalTime(dateTime);
    return DateFormat('jms', currentLocale.languageCode).format(localTime);
  }

  static String time12Format(DateTime? dateTime) {
    if (dateTime == null) return '';
    final localTime = toLocalTime(dateTime);
    return DateFormat('jm', currentLocale.languageCode).format(localTime);
  }

  static String time24Format(DateTime dateTime) {
    final localTime = toLocalTime(dateTime);
    return DateFormat('HH:mm', currentLocale.languageCode).format(localTime);
  }

  static String slashFormatDate(DateTime dateTime) {
    final localTime = toLocalTime(dateTime);
    return DateFormat('yyyy-MM-dd').format(localTime);
  }

  static String formatDateAndTime(DateTime dateTime) {
    final localTime = toLocalTime(dateTime);
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(localTime);
  }

  static String formatLongDateAndTime(DateTime dateTime) {
    final localTime = toLocalTime(dateTime);
    return DateFormat(
      'dd MMMM yyyy - hh:mm a',
      currentLocale.languageCode,
    ).format(localTime);
  }

  static DateTime combineDateTime(DateTime date, TimeOfDay time) {
    final localDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    return toUtcTime(localDateTime);
  }

  static TimeOfDay? dateTimeToTimeOfDay(DateTime? dateTime) {
    if (dateTime == null) return null;
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  // customized time ago function [ago]
  // static String customTimeAgo(DateTime notificationTime) {
  //   final translate = LocalizationService.instance!;
  //   final now = DateTime.now();
  //   final difference = now.difference(notificationTime);

  //   if (difference.inSeconds < 60) {
  //     return 'un momento';
  //   } else if (difference.inMinutes < 60) {
  //     return '${difference.inMinutes} ${translate.minutes(difference.inMinutes)}';
  //   } else if (difference.inHours < 24) {
  //     return '${difference.inHours} ${translate.hours(difference.inHours)}';
  //   } else if (difference.inDays < 30) {
  //     return '${difference.inDays}  ${translate.days(difference.inDays)}';
  //   } else if (difference.inDays < 365) {
  //     return '${(difference.inDays / 30).floor()} ${translate.months((difference.inDays / 30).floor())}';
  //   } else {
  //     return '${(difference.inDays / 365).floor()} ${translate.year((difference.inDays / 365).floor())}';
  //   }
  // }

  static int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    var age = today.year - birthDate.year;

    // Adjust if the birthdate hasn't occurred yet this year
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  static DateTime? getCombinedDateTime(DateTime? date, TimeOfDay? time) {
    if (date != null && time != null) {
      return DateTime(date.year, date.month, date.day, time.hour, time.minute);
    }
    return null;
  }

  static bool isDatePassed(DateTime dateToCheck) {
    final now = DateTime.now();
    return dateToCheck.isBefore(now);
  }

  static bool checkIfSelectedDateTimeIsPast({
    required DateTime date,
    required TimeOfDay time,
    DateTime? endTime,
  }) {
    // Get the current time
    final compareTime = endTime ?? DateTime.now();

    // Combine _selectedDate and _selectedTime into a single DateTime object
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    // Compare the combined DateTime with the given time or current time
    return dateTime.isBefore(compareTime);
  }

  static String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  // get total                                                                    time duration in a readable format
  static String getTimeDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);
    final isNegative = duration.isNegative;
    final absDuration = duration.abs();

    final weeks = absDuration.inDays ~/ 7;
    final days = absDuration.inDays % 7;
    final hours = absDuration.inHours % 24;
    final minutes = absDuration.inMinutes % 60;

    final parts = <String>[];

    if (weeks > 0) {
      parts.add('$weeks ${weeks == 1 ? 'week' : 'weeks'}');
    }
    if (days > 0) {
      parts.add('$days ${days == 1 ? 'day' : 'days'}');
    }
    if (hours > 0 && weeks == 0) {
      parts.add('$hours ${hours == 1 ? 'hour' : 'hours'}');
    }
    if (minutes > 0 && weeks == 0 && days == 0) {
      parts.add('$minutes ${minutes == 1 ? 'minute' : 'minutes'}');
    }

    // If duration is less than a minute, show seconds
    if (parts.isEmpty) {
      final seconds = absDuration.inSeconds;
      parts.add('$seconds ${seconds == 1 ? 'second' : 'seconds'}');
    }

    // Limit to 2 most significant units for readability
    final result = parts.take(2).join(' ');

    return isNegative ? '-$result' : result;
  }

  // format duration to a MM:SS format
  static String formatDurationToMMSS(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  static bool isFuture(DateTime? dateTime) {
    if (dateTime == null) return false;
    return dateTime.isAfter(DateTime.now());
  }
}
