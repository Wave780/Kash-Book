import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_location.dart';
import 'app_routes.dart';

final routesProvider = Provider<GoRouter>((ref) => GoRouter(
    initialLocation: RouteLocation.loginScreen,
    navigatorKey: navigationKey,
    routes: appRoutes));
