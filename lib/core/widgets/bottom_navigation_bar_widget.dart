import 'package:easy_localization/easy_localization.dart';
import 'package:ecr/core/common/app_colors.dart';
import 'package:ecr/core/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  static void goOtherTab(BuildContext context, int index) {
    _ScaffoldWithNavBarState.goOtherTab(context, index);
  }

  static int currentindex = 0;
  ScaffoldWithNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  @override
  void initState() {
    super.initState();
  }

  static int _currentIndex = ScaffoldWithNavBar.currentindex;

  static List<String> routes = [
    Routes.mainScreen,
    Routes.toDoScreen,
    Routes.accountScreen,
  ];

  static List<BottomNavigationBarItem> tabs = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.dashboard,
      ),
      label: "dashboard".tr(),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.calendar_month,
      ),
      label: 'todo'.tr(),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle_rounded,
      ),
      label: 'account'.tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: List.filled(
            3,
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.1,
              spreadRadius: 0.01,
            ),
            growable: true,
          ),
          // gradient: LinearGradient(
          //   colors: [Colors.white.withOpacity(0.1), Colors.transparent],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: BottomNavigationBar(
          // backgroundColor: Colors.transparent,
          enableFeedback: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          useLegacyColorScheme: true,
          selectedLabelStyle: TextStyle(locale: context.locale),
          // unselectedItemColor: Colors.grey,
          // backgroundColor: AppColors.purple,
          selectedItemColor: AppColors.blue,

          onTap: (int index) {
            setState(() {
              goOtherTab(context, index);
            });
          },
          currentIndex: _currentIndex,
          items: tabs,
          iconSize: 30,
        ),
      ),
    );
  }

  static void goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = routes[index];

    _currentIndex = index;
    router.go(location);
  }
}
