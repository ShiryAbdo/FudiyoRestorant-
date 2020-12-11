import 'package:flutter/material.dart' show GlobalKey, NavigatorState;

class AppNavigatorState {
  final navigatorKey = GlobalKey<NavigatorState>();
}

final appNavigatorState = AppNavigatorState();
