import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rightware/routs.dart';
import 'package:rightware/utils/root-navigator-key.dart';

import 'helpers/config/app_config.dart';
import 'helpers/config/themes/theme-config-light.dart';
import 'helpers/database/local_storage.dart';

void appRunner(AppConfig appConfig) async {
  //Intl.defaultLocale = 'ar';
  final httpClient = appConfig.httpClient;
  final localStorage = await LocalStorage().init();
  runApp(MultiProvider(
    providers: [],
    child: MyApp(
      appConfig: appConfig,
    ),
  ));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = await AppConfig().init();
  appRunner(appConfig);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appConfig}) : super(key: key);
  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (child) {
        return MaterialApp(
          theme: lightTheme(context),
          debugShowCheckedModeBanner: false,
          navigatorKey: rootNavigatorKey,
          onGenerateRoute: (RouteSettings settings) => buildRoute(settings),
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[Locale("ar")],
        );
      },
    );
  }
}
