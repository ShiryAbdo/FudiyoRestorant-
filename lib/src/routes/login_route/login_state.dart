// import 'package:flutter/foundation.dart';
// import 'package:jawahr/src/globals/app_state.dart';
// import 'package:jawahr/src/models/response_models/repository_response.dart';
// import 'package:jawahr/src/repository/auth_repository.dart';
// import 'package:jawahr/src/repository/user_repository/notifications_repository.dart';
//
// class LoginState extends ChangeNotifier {
//   String user = '', pass = '';
//
// //  String userEr, pa@jawahr.comsEr;
//
//   Future<RepositoryResponse> login() async {
//     return await authRepository.postLogin(user, pass);
//   }
//
//   Future fetchUserData() async {
//     await notificationRepository.updatePushNotificationToken(appState.pushToken);
//     await appState.authCalls();
//     notifyListeners();
//   }
//
//   void userChanged(String value) {
//     user = value;
//   }
//
//   void passChanged(String value) {
//     pass = value;
//     notifyListeners();
//   }
//
//   bool get isFieldsEmpty => user.isEmpty || pass.isEmpty;
// }


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:shaimaa_fudiyo/src/routes/otp_route/otp_route.dart';
import 'package:shaimaa_fudiyo/src/routes/register_route/register_route.dart';

final loginViewModel =
ChangeNotifierProvider.autoDispose<LoginViewModel>((ref) {
  return LoginViewModel();
});

class LoginViewModel extends ChangeNotifier {
  final numberNode = FocusNode();
   final numberController = TextEditingController();
  final bodyController = TextEditingController();
  String  numberError;

  bool loading = false;

  goOtp(BuildContext context) async {

    Navigator.pushNamed(context, OtpRoute.name);


  }


  goRegistration(BuildContext context) async {
    Navigator.pushNamed(context, RegisterRoute.name);
  }


  bool validateInput() {
    if (numberController.text.isEmpty) {
      numberError = tr('please inter your phone');
      notifyListeners();
      return false;
    }

    return true;
  }

  removeErrors() {
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
