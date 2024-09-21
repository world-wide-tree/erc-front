import 'package:ecr/core/utils/theme_data.dart';
import 'package:ecr/features/presentation/screens/doctor/home_screen.dart';
import 'package:ecr/features/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routings extends StatelessWidget {
  Routings({super.key});
  static final shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'debug');

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      // ShellRoute(
      //     builder: (context, state, child) {
      //       return ScaffoldWithNavBar(
      //         child: child,
      //       );
      //     },
      //     routes: [
      //       // GoRoute(
      //       //   name: 'main',
      //       //   path: Routes.mainScreen,
      //       //   builder: (context, state) => HomeScreen(),
      //       // ),
      //     ]),
      GoRoute(
        name: 'loginScreen',
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'doctorHomeScreen',
        path: '/doctorHomeScreen',
        builder: (context, state) => const DoctorHomeScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "ReCardio",
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
