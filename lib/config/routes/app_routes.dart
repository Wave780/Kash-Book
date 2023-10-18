import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/screen/login_screen.dart';

import 'app_location.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(path: RouteLocation.loginScreen,
  parentNavigatorKey: navigationKey,
  builder: LoginScreen.builder,
  )
];
