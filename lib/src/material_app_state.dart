import 'package:flutter/foundation.dart';

class MaterialAppState with ChangeNotifier {
  /// Used to apply new changes made to MaterialApp properties
  /// e.g. Font and Locale.
  void rebuildMaterialApp() {
    notifyListeners();
  }
}
