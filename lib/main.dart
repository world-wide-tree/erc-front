import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecr/app/app.dart';
import 'package:ecr/di/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/adapters.dart';
import 'package:pwa_install/pwa_install.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  PWAInstall().setup(installCallback: () {
    debugPrint('APP INSTALLED!');
  });
  if (!kIsWeb) {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    Hive.init(appDocumentDir.path);
  }
  await init();

  // await initializeService();
  runApp(
    EasyLocalization(
      startLocale: const Locale('ru'),
      saveLocale: true,
      supportedLocales: const [
        Locale('uz'),
        Locale('ru'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: MyApp(),
    ),
  );
}
