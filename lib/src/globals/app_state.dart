import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show debugPrint;

class AppState {
  static const fileName = 'appState';

  bool _auth;
  bool _notificationOpened = true;
  String _roleId;
  String _orderNumber;
  bool _navigatedDynamicLinks = true;

  AppState._internal();

  static final _singleton = AppState._internal();

  factory AppState() => _singleton;
}

final appState = AppState();
