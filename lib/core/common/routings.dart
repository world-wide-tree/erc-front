import 'package:ERC/core/common/routes.dart';
import 'package:ERC/core/utils/theme_data.dart';
import 'package:ERC/features/presentation/screens/doctor/about_patient_screen.dart';
import 'package:ERC/features/presentation/screens/doctor/home_screen.dart';
import 'package:ERC/features/presentation/screens/patient/patient_more.dart';
import 'package:ERC/features/presentation/screens/login_screen.dart';
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
        path: Routes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'doctorHomeScreen',
        path: Routes.doctorHomeScreen,
        builder: (context, state) => const DoctorHomeScreen(),
      ),
      GoRoute(
        name: 'patientHomeScreen',
        path: Routes.patientHomeScreen,
        builder: (context, state) => const PatientMoreScreen(),
      ),
      GoRoute(
        name: 'aboutPatientScreen',
        path: Routes.aboutPatientScreen,
        builder: (context, state) => const AboutPatientScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "ERC",
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
