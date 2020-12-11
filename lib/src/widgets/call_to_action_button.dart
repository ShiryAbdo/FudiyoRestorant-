import 'package:flutter/material.dart';
import 'package:shaimaa_fudiyo/src/widgets/utility_widgets/constant_widgets.dart';


class CallToActionButton extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final Function buttonCallback;
  final bool fullTransparent;
  final EdgeInsets padding;
  final bool mediumSize;
  final bool loading;
  final bool disabled;

  /// To add other widgets besides the button's text, like an icon.
  final List<Widget> buttonChildren;

  const CallToActionButton({
    @required this.buttonText,
    @required this.buttonCallback,
    this.buttonTextColor,
    this.buttonColor,
    this.fullTransparent = false,
    this.padding,
    this.loading = false,
    this.buttonChildren,
    this.mediumSize = false,
    this.disabled = false,
  }) : assert(buttonText != null);

  @override
  Widget build(BuildContext context) {
    final defaultFont = 'Cairo';
    return Container(
      decoration: fullTransparent
          ? const BoxDecoration(color: Colors.transparent)
          : BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(36),
              ),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.5),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const <double>[0.01, 0.1, 0.25],
              ),
            ),
      padding: padding ??
          (mediumSize
              ? const EdgeInsets.symmetric(vertical: 16.0)
              : const EdgeInsets.all(16)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediumSize ? constraints.maxWidth * 0.15 : 0.0,
            ),
            child: FlatButton(
              onPressed: loading || disabled ? () {} : () => buttonCallback(),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(36),
                ),
              ),
              color: buttonColor ??
                  (disabled ? Colors.grey[400] : Theme.of(context).accentColor),
              splashColor: Colors.black12,
              child: SizedBox(
                height: 46,
                child: Center(
                  child: loading
                      ? whiteLoader
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ...?buttonChildren,
                            if (buttonChildren != null)
                              const SizedBox(width: 8.0),
                            Text(
                              buttonText.toUpperCase(),
                              style: TextStyle(
                                fontFamily: defaultFont,
                                fontWeight: FontWeight.bold,
                                color : Colors.white ,
                                fontSize: 14

                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CallToActionButtonOutlined extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;
  final VoidCallback buttonCallback;
  final EdgeInsets padding;
  final bool loading;
  final bool mediumSize;
  final Color borderColor;

  /// To add other widgets besides the button's text, like an icon.
  final List<Widget> buttonChildren;

  const CallToActionButtonOutlined({
    @required this.buttonText,
    @required this.buttonCallback,
    this.buttonTextColor,
    this.padding,
    this.loading = false,
    this.buttonChildren,
    this.mediumSize = false,
    this.borderColor,
  }) : assert(buttonText != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          (mediumSize
              ? EdgeInsets.symmetric(vertical: 16.0)
              : const EdgeInsets.all(16)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediumSize ? constraints.maxWidth * 0.1 : 0.0),
            child: OutlineButton(
              onPressed: buttonCallback,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              color: Theme.of(context).primaryColor,
              borderSide: BorderSide(
                  color: borderColor ?? Theme.of(context).primaryColor,
                  width: 1.0),
              highlightedBorderColor: Theme.of(context).primaryColor,
              child: SizedBox(
                height: 48,
                child: Center(
                  child: loading
                      ? defaultLoader
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ...?buttonChildren,
                            Text(
                              buttonText.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: buttonTextColor ??
                                      Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
