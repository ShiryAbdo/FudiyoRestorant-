// import 'dart:io';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import 'package:shaimaa_fudiyo/src/utils/StringValidator/validator.dart';
//
// import 'otp_token/otp_token_route.dart';
//
// class OtpRoute extends StatefulWidget {
//   static const name = 'otp';
//   final String pushedFromDateRoute;
//
//   const OtpRoute({this.pushedFromDateRoute});
//
//   @override
//   _OtpRouteState createState() => _OtpRouteState();
// }
//
// class _OtpRouteState extends State<OtpRoute> with  WidgetsBindingObserver  {
//   final mobileNode = FocusNode();
//   final mobileController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   var _isKeyboardVisible = false;
//
//   OtpState state;
//
//   bool loading = false;
//
//   @override
//   void didChangeDependencies() {
//     final state = Provider.of<OtpState>(context);
//     if (this.state != state) {
//       this.state = state;
//     }
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     mobileNode.dispose();
//     mobileController.dispose();
//     super.dispose();
//   }
//   @override
//   void didChangeMetrics() {
//     final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
//     final newValue = bottomInset > 0.0;
//     if (newValue != _isKeyboardVisible) {
//       setState(() {
//         _isKeyboardVisible = newValue;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//
//   Widget mobileTextField() {
//     return AppTextField(
//       autofillHints: [AutofillHints.telephoneNumber],
//       label: '${tr('mobile')}',
//       hint: '${tr('please_enter')} '
//           '${tr('mobile')}',
//       validator: (input) => isSaudiMobile(input)
//           ? null
//           : '${tr('mobile_number_must_be_saudi')} ',
//       onSaved: (value) => state.mobile = value,
//       onChange: state.mobileChanged,
//       icon: Icons.phone,
//       keyboardType: TextInputType.phone,
//       focusNode: mobileNode,
//     );
//   }
//
//   Widget loginOtpButton() {
//     return Builder(builder: (context) {
//       return Padding(
//           padding: Platform.isIOS
//               ? EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom + 35,
//                 )
//               : EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom,
//                 ),
//           child: CallToActionButton(
//             fullTransparent: !_isKeyboardVisible,
//             padding: EdgeInsets.zero,
//             buttonCallback: requestOtpTokenCallback(context),
//             buttonText: tr('send'),
//             loading: loading,
//             disabled: state.isMobileInputEmpty,
//           ));
//     });
//   }
//
//   Widget appBarTitle() {
//     return Text(tr('sign_up_phone'));
//   }
//
//   List<Widget> children() {
//     return <Widget>[
//       const Spacer(),
//       mobileTextField(),
//       const Spacer(flex: 2),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formKey,
//         child: GestureDetector(
//           onTap: dismissKeyboard(context),
//           child: appState.isJawahr
//               ? CenterLogoButton(
//                   hasLogo: true,
//                   button: loginOtpButton(),
//                   appBarTitle: appBarTitle(),
//                   avoidKeyboardOverflow: false,
//                   children: children(),
//                 )
//               : Scaffold(
//                   resizeToAvoidBottomInset: false,
//                   appBar: AppBar(
//                     title: appBarTitle(),
//                     elevation: 0,
//                   ),
//                   body: Builder(
//                     builder: (BuildContext context) {
//                       return StackButtonBody(
//                         button: CallToActionButton(
//                           fullTransparent: true,
//                           buttonText: tr('send'),
//                           buttonCallback: requestOtpTokenCallback(context),
//                           loading: loading,
//                         ),
//                         bodyChildren: children(),
//                       );
//                     },
//                   ),
//                 ),
//         ));
//   }
//
//   VoidCallback requestOtpTokenCallback(context) {
//     return state.isMobileInputEmpty
//         ? () {}
//         : () async {
//             if (_formKey.currentState.validate()) {
//               _formKey.currentState.save();
//               setState(() {
//                 loading = true;
//               });
//               try {
//                 final response = await state.requestOtpToken();
//                 if (response.success) {
//                   setState(() {
//                     loading = false;
//                   });
//                   final args = <String, dynamic>{
//                     'forwardAddress': widget.pushedFromDateRoute,
//                     'mobileNumber': state.mobile,
//                   };
//                   Navigator.pushNamed(
//                     context,
//                     OtpTokenRoute.name,
//                     arguments: args,
//                   );
//                 } else {
//                   showErrorDialog(context, response);
//                 }
//               } catch (onError) {
//                 debugPrint('$runtimeType.loginOtpCallback.onError: $onError');
//               } finally {
//                 if (loading) {
//                   setState(() {
//                     loading = false;
//                   });
//                 }
//               }
//             }
//           };
//   }
// }

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shaimaa_fudiyo/src/routes/boot_route/boot_state.dart';
import 'package:shaimaa_fudiyo/src/routes/otp_route/otp_state.dart';
import 'package:shaimaa_fudiyo/src/theme/colors.dart';
import 'package:shaimaa_fudiyo/src/utils/common_methods.dart';
import 'package:shaimaa_fudiyo/src/widgets/app_text_field.dart';
import 'package:shaimaa_fudiyo/src/widgets/call_to_action_button.dart';
import 'package:shaimaa_fudiyo/src/widgets/scaffolds/radial_body_clipper.dart';
import 'package:shaimaa_fudiyo/src/widgets/utility_widgets/sizer.dart';

class OtpRoute extends ConsumerWidget {
  static const name = 'OtpRoute';

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
                          "OTP",
                          style: TextStyle(
                            color: title,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric( horizontal: 50) ,
                        child:
                        Text(
                          "Enter the verification  we just sent you on your mobile number",
                          style: TextStyle(
                            color: Color(0xFF222C38) ,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ) ,

                        Sizer.vertical32(),

                        Sizer.half(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 40),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 5,
                            obscureText: false,
                            obscuringCharacter: '*',
                            animationType: AnimationType.fade,
                              errorTextSpace:25.0,
                            validator: (v) {
                              if (v.length < 4) {
                                return "I'm from validator";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(60),
                              fieldHeight: 48,
                              fieldWidth: 49,
                              selectedColor:  Color(0xFF222C38),
                              inactiveColor:  Color(0xFF222C38),
                              inactiveFillColor: Colors.transparent,
                              selectedFillColor: Colors.transparent,
                              activeFillColor: viewModel.hasError
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(fontSize: 20, height: 1.6),
                             enableActiveFill: true,
                            errorAnimationController:
                                viewModel.errorController,
                            controller: viewModel.textEditingController,
                            keyboardType: TextInputType.number,

                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              viewModel.currentText = value;
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          ),
                        ),
                        Sizer.vertical32(),

                        // Sizer.vertical32(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Builder(
                            builder: (context) {
                              return CallToActionButton(
                                  buttonText: tr('VERIFY'),
                                  buttonColor: green,
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
                                'Don’t receive the OTP ?',
                                style: TextStyle(
                                    color: Color(0xFF222C38)),
                              ),
                            ),
                            const Sizer.qtrHor(),
                            Flexible(
                              child: InkWell(
                                onTap: () => viewModel.goRegistration(context),
                                child: Text(
                                  'Resend OTP',
                                  style: TextStyle(
                                     color: Colors.red,
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
