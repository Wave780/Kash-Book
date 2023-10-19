import 'package:flutter/material.dart';

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get splashScreen => '/splashScreen';
  static String get welcomeScreen => '/welcomeScreen';
  static String get loginScreen => '/loginScreen';
}
