import 'package:flutter/material.dart';

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get splashScreen => '/splashScreen';
  static String get authScreen => '/authScreen';
  static String get welcomeScreen => '/welcomeScreen';
  static String get loginScreen => '/loginScreen';
  static String get createAcctScreen => '/createAcctScreen';
  static String get forgottenPasswordScreen => '/forgottenPasswordScreen';
  static String get homeScreen => '/homeScreen';
}
