import 'package:auto_route/auto_route.dart';
import 'package:ampera_vision_test/config/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LocationsRoute.page, initial: true),
    AutoRoute(page: LocationInfoRoute.page),
  ];
}
