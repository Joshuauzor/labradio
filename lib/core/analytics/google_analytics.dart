import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/core/core.dart';

@lazySingleton
class GoogleAnalytics {
  /// log the screen a user visited [screenName] and [subScreen]
  /// [screenName] is the main screen
  /// [subScreen] can be any modal in the screen or bottomsheet
  Future<void> logScreenView({
    required SCREENS screenName,
    String? subScreen,
  }) async {
    await FirebaseAnalytics.instance.logScreenView(
      screenClass: screenName.name,
      screenName: subScreen,
    );
  }

  // log events like share, notification, click etc
  Future<void> logEvent({required ACTIONS event}) async {
    await FirebaseAnalytics.instance.logEvent(name: event.name);
  }

  /// log user
  Future<void> logUser({required String userId}) async {
    await FirebaseAnalytics.instance.setUserId(id: userId);
  }

  Future<void> logLogin({required LoginMethods loginMethod}) async {
    await FirebaseAnalytics.instance.logLogin(loginMethod: loginMethod.name);
  }

  Future<void> logSignUp({required String signUpMethod}) async {
    await FirebaseAnalytics.instance.logSignUp(signUpMethod: signUpMethod);
  }
}
