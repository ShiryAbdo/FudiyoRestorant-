import 'package:flutter/material.dart';

  import 'package:shaimaa_fudiyo/src/routes/login_route/login_route.dart';
 import 'package:shaimaa_fudiyo/src/routes/otp_route/otp_route.dart';
 import 'package:shaimaa_fudiyo/src/routes/register_route/register_route.dart';


class AppRouter {
  static Route router(RouteSettings settings) {
    switch (settings.name) {
      case LoginRoute.name:
        return   MaterialPageRoute(
          fullscreenDialog: true,
          settings: RouteSettings(name: LoginRoute.name),
          builder: (context) => LoginRoute(),
        );

      case RegisterRoute.name:
        return   MaterialPageRoute(
          fullscreenDialog: true,
          settings: RouteSettings(name: RegisterRoute.name),
          builder: (context) => RegisterRoute(),
        );

      case OtpRoute.name:
        return   MaterialPageRoute(
          fullscreenDialog: true,
          settings: RouteSettings(name: OtpRoute.name),
          builder: (context) => OtpRoute(),
        );

      // case HomeRoute.name:
      //   return MaterialPageRoute(
      //     maintainState: false,
      //     settings: RouteSettings(name: HomeRoute.name, arguments: Map()),
      //     builder: (context) => HomeRoute(),
      //   );

      default:
        return MaterialPageRoute(
          maintainState: false,
          settings: RouteSettings(name: LoginRoute.name),
          builder: (context) => LoginRoute(),
        );
    }
  }
}
