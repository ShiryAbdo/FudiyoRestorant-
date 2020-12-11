import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:shaimaa_fudiyo/app.dart';
import 'package:shaimaa_fudiyo/src/helpers/app_locale.dart';
import 'package:shaimaa_fudiyo/src/material_app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// This line should be only used when testing, by default it's commented.
  // SharedPreferences.setMockInitialValues({}); // set initial values here if desired

  /// Disable logs in release mode.
  if (kReleaseMode) debugPrint = (String message, {int wrapWidth}) {};
  if (!kIsWeb) {
    /// Disable red screen of death in production.
    // ErrorWidget.builder =
    //     (FlutterErrorDetails details) => const SizedBox.shrink();

    await SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
    // Set `enableInDevMode` to true to see reports while in debug mode
    // This is only to be used for confirming that reports are being
    // submitted as expected. It is not intended to be used for everyday
    // development.

    // Pass all uncaught errors from the framework to Crashlytics.

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
    }).sendPort);
  }
  runApp(
    riverpod.ProviderScope(
      child: DevicePreview(
        enabled: false,
        builder: (context) => EasyLocalization(
          useOnlyLangCode: false,
          supportedLocales: <Locale>[
            Locale('en'), Locale('ar')
          ],
           path: 'assets/i18n',
          fallbackLocale: const Locale('en'),
          startLocale: const Locale('en'),

          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<MaterialAppState>(
                create: (_) => MaterialAppState(),
              ),
              // ChangeNotifierProvider<HomeState>(
              //   create: (_) => HomeState(),
              // ),
            ],
            child: App(),
          ),
        ),
      ),
    ),
  );
}
