import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaimaa_fudiyo/src/routes/boot_route/boot_state.dart';
import 'package:shaimaa_fudiyo/src/theme/colors.dart';
import 'package:shaimaa_fudiyo/src/utils/common_methods.dart';
import 'package:shaimaa_fudiyo/src/widgets/call_to_action_button.dart';
import 'package:shaimaa_fudiyo/src/widgets/utility_widgets/sizer.dart';

class BootRoute extends ConsumerWidget {
  static const name = 'BootRoute';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(bootViewModel);
    return GestureDetector(
      onTap: dismissKeyboard(context),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  child: SvgPicture.asset(
                    'assets/svg/asset_three.svg',
                  ),
                ),
              ),
              Positioned(
                top: 118.0,
                right: 0.0,
                child: Container(
                  child: SvgPicture.asset(
                    'assets/svg/rice.svg',
                    width: 190,
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                child: Container(
                  child: SvgPicture.asset(
                    'assets/svg/Asset_two.svg',
                  ),
                ),
              ),
              Positioned(
                top: 325,
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: Container(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/svg/Logo.svg',
                            // height: 130,
                          ),
                          Text(
                            "Welcome to Fudiyo",
                            style: TextStyle(
                              color: title,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            " Mutta roast gravy dish popular spicy Kerala",
                            style: TextStyle(
                              color: gray,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Sizer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Builder(
                              builder: (context) {
                                return CallToActionButton(
                                    buttonText: tr('LOG IN'),
                                    buttonColor: mellow,
                                    buttonCallback: () =>
                                        viewModel.goLogin(context),
                                    padding: EdgeInsets.zero,
                                    loading: viewModel.loading,
                                    disabled: false);
                              },
                            ),
                          ),
                          const Sizer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Builder(
                              builder: (context) {
                                return CallToActionButton(
                                    buttonText:
                                        tr('Don’t have an Account ? Register'),
                                    buttonColor: green,
                                    buttonCallback: () =>
                                        viewModel.goRegistration(context),
                                    padding: EdgeInsets.zero,
                                    loading: viewModel.loading,
                                    disabled: false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

}
