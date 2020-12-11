import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:shaimaa_fudiyo/src/routes/login_route/login_route.dart';

final registerViewModel =
ChangeNotifierProvider.autoDispose<RegisterViewModel>((ref) {
  return RegisterViewModel();
});

class RegisterViewModel extends ChangeNotifier {
  final userNameNode = FocusNode();
  final emailNode = FocusNode();
  final numberNode = FocusNode();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  String userNameError;
  String emailError;
  String numberError;

  bool loading = false;

  goLogin(BuildContext context) async {
    Navigator.pushReplacementNamed(context, LoginRoute.name);

  }

  goRegistration(BuildContext context) async {

  }

  bool validateInput() {
    if (userNameController.text.isEmpty) {
      userNameError = tr('Enter your name');
      notifyListeners();
      return false;
    }
    if (emailController.text.isEmpty) {
      emailError = tr('Enter your email');
      notifyListeners();
      return false;
    }
    if (numberController.text.isEmpty) {
      numberError = tr('Enter your number');
      notifyListeners();
      return false;
    }
    return true;
  }

  removeErrors() {
    userNameError = null;
    emailError = null;
    numberError = null;
    notifyListeners();
  }

  checkValidity() {
    notifyListeners();
  }

  toggleLoading(bool on) {
    loading = on;
    notifyListeners();
  }
}
