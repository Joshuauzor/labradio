import 'package:url_launcher/url_launcher.dart';

extension UrlLauncherExtension on String {
  Future<dynamic> get launch {
    return launchUrl(Uri.parse(this));
  }
}
