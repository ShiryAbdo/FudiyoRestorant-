import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaimaa_fudiyo/src/routes/login_route/login_state.dart';
import 'package:shaimaa_fudiyo/src/theme/colors.dart';
import 'package:shaimaa_fudiyo/src/utils/common_methods.dart';
import 'package:shaimaa_fudiyo/src/widgets/app_text_field.dart';
import 'package:shaimaa_fudiyo/src/widgets/call_to_action_button.dart';
import 'package:shaimaa_fudiyo/src/widgets/utility_widgets/sizer.dart';

class LoginRoute extends ConsumerWidget {
  static const name = 'LoginRoute';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(loginViewModel);
    return GestureDetector(
      onTap: dismissKeyboard(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/svg/background.svg',
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            color: title,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Sizer.vertical64(),
                        Sizer.vertical32(),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text("Mobile Number",
                                style: TextStyle(
                                    color: title,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.start)),
                        Sizer.half(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: AppTextField(
                            controller: viewModel.numberController,
                            focusNode: viewModel.numberNode,
                            hint: tr('9447752786'),
                            label: '',
                            autoFocus: true,
                            error: viewModel.numberError,
                            maxLines: 1,
                            onChange: (_) => viewModel.checkValidity(),
                          ),
                        ),
                        Sizer.vertical32(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Builder(
                            builder: (context) {
                              return CallToActionButton(
                                  buttonText: tr('SEND OTP'),
                                  buttonColor: mellow,
                                  buttonCallback: () =>
                                      viewModel.goOtp(context),
                                  padding: EdgeInsets.zero,
                                  loading: viewModel.loading,
                                  disabled: false);
                            },
                          ),
                        ),
                        Sizer.vertical48(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: AutoSizeText(
                                'Don’t have an account?',
                                style: TextStyle(
                                    color:Color(0xFF222C38)),
                              ),
                            ),
                            const Sizer.qtrHor(),
                            Flexible(
                              child: InkWell(
                                onTap: () => viewModel.goRegistration(context),
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF222C38),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
