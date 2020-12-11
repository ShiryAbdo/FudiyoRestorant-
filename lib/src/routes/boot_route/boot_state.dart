import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:shaimaa_fudiyo/src/network/api/user/user_api.dart';
import 'package:shaimaa_fudiyo/src/routes/login_route/login_route.dart';
import 'package:shaimaa_fudiyo/src/routes/register_route/register_route.dart';

final bootViewModel =
ChangeNotifierProvider.autoDispose<BootViewModel>((ref) {
  return BootViewModel();
});

class BootViewModel extends ChangeNotifier {
  final titleNode = FocusNode();
  final bodyNode = FocusNode();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  String titleError;
  String bodyError;

  bool loading = false;

  goLogin(BuildContext context) async {
    print('shaimaaaaaaaaaaa');
     UsersApi().register("", "");
    UsersApi().getCategories();
    UsersApi().getDistrict();

     // Navigator.pushNamed(context, LoginRoute.name);

  }

  goRegistration(BuildContext context) async {
    Navigator.pushNamed(context, RegisterRoute.name);
  }

  bool validateInput() {
    if (titleController.text.isEmpty) {
      titleError = tr('enter_title');
      notifyListeners();
      return false;
    }
    if (bodyController.text.isEmpty) {
      bodyError = tr('share_opinion');
      notifyListeners();
      return false;
    }
    return true;
  }

  removeErrors() {
    titleError = null;
    bodyError = null;
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
