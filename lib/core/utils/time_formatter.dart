import 'package:timeago/timeago.dart' as timeago;

class CustomEnMessages extends timeago.EnMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '${minutes}m';
  @override
  String minutes(int minutes) => '${minutes}m';
  @override
  String aboutAnHour(int minutes) {
    return (minutes >= 60) ? '1h' : '${minutes}m';
  }

  @override
  String hours(int hours) => '${hours}h';

  @override
  String aDay(int hours) {
    return (hours >= 24) ? '1d' : '${hours}h';
  }

  @override
  String days(int days) => '${days}d';
  @override
  String aboutAMonth(int days) => '${days}d';
  @override
  String months(int months) => '${months}mo';
  @override
  String aboutAYear(int year) => '${year}y';
  @override
  String years(int years) => '${years}y';
  @override
  String wordSeparator() => ' ';
}

class CustomEsMessages extends timeago.EsMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'ahora';
  @override
  String aboutAMinute(int minutes) => '${minutes}m';
  @override
  String minutes(int minutes) => '${minutes}m';
  @override
  String aboutAnHour(int minutes) {
    return (minutes >= 60) ? '1h' : '${minutes}m';
  }

  @override
  String hours(int hours) => '${hours}h';

  @override
  String aDay(int hours) {
    return (hours >= 24) ? '1d' : '${hours}h';
  }

  @override
  String days(int days) => '${days}d';
  @override
  String aboutAMonth(int days) => '1mes';
  @override
  String months(int months) => '${months}meses';
  @override
  String aboutAYear(int year) => '1año';
  @override
  String years(int years) => '${years}años';
  @override
  String wordSeparator() => ' ';
}
