class UrlUtils {
  static bool urlIsSecure(Uri url) {
    return (url.scheme == 'https');
  }
}
