import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/screen/screen.dart';

import 'app_location.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [

  GoRoute(
    path: RouteLocation.splashScreen,
    parentNavigatorKey: navigationKey,
    builder: SplashScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.welcomeScreen,
    parentNavigatorKey: navigationKey,
    builder: WelcomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.loginScreen,
    parentNavigatorKey: navigationKey,
    builder: LoginScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createAcctScreen,
    parentNavigatorKey: navigationKey,
    builder: CreateAcctScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.forgottenPasswordScreen,
    parentNavigatorKey: navigationKey,
    builder: ForgottenPasswordScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.homeScreen,
    parentNavigatorKey: navigationKey,
    builder: RootScreen.builder,
  )
];
