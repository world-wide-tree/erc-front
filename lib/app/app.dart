import 'package:easy_localization/easy_localization.dart';
import 'package:ecr/core/common/routings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      /*const Size(430.0, 932.0),*/
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) {
        ScreenUtil.init(ctx);
        return MaterialApp(
          title: "ECR",
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          home: Routings(),
        );
      },
    );
  }
}
