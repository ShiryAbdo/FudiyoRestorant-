import 'package:flutter/cupertino.dart' show CupertinoThemeData;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shaimaa_fudiyo/router.dart';
import 'package:shaimaa_fudiyo/src/globals/app_navigator_state.dart';
import 'package:shaimaa_fudiyo/src/helpers/environments.dart';
import 'package:shaimaa_fudiyo/src/routes/boot_route/boot_route.dart';
import 'package:shaimaa_fudiyo/src/theme/colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultFont = 'Cairo';
    final defaultTextStyle = TextStyle(
      fontFamily: defaultFont,
    );

    return MaterialApp(
      navigatorKey: appNavigatorState.navigatorKey,
      home: BootRoute(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.router,
      title: "Shaimaa",
      localizationsDelegates: [
        EasyLocalization.of(context).delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale:
      uiDebugView ? DevicePreview.locale(context) : EasyLocalization.of(context).locale,
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      theme: ThemeData(
        cupertinoOverrideTheme:
            const CupertinoThemeData(brightness: Brightness.light),
        primaryColor: darkCerulean,
        accentColor: mellow,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: darkCerulean,
        ),
        scaffoldBackgroundColor: darkCerulean,
        fontFamily: defaultFont,
        textTheme: TextTheme(
          headline1: defaultTextStyle,
          headline2: defaultTextStyle,
          headline3: defaultTextStyle,
          headline4: defaultTextStyle,
          headline5: defaultTextStyle,
          headline6: defaultTextStyle,
          subtitle1: defaultTextStyle,
          bodyText1: defaultTextStyle,
          bodyText2: defaultTextStyle,
          caption: defaultTextStyle,
          button: defaultTextStyle,
          subtitle2: defaultTextStyle,
          overline: defaultTextStyle,
        ),
        highlightColor: chineseViolet,
        splashColor: chineseViolet,
      ),
    );
  }
}
