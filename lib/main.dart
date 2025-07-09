import 'package:flutter/material.dart';
import 'package:ampera_vision_test/config/injectable.dart';
import 'package:ampera_vision_test/config/router/router.dart';
import 'package:ampera_vision_test/styles/colors.dart';
import 'package:ampera_vision_test/styles/size_config.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final appRouter = AppRouter(navigatorKey: navigatorKey);

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(scrolledUnderElevation: 0.0, elevation: 0.0, color: Colors.transparent),
      ),
    );
  }
}
