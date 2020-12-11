import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'utility_widgets/sizer.dart';

mixin AuthWidgets {
  /// Returns a [String] question, a [FlatButton] call to action button and
  /// its [String] text.
  Widget authQuestionAction({
    @required String questionText,
    @required String actionText,
    @required VoidCallback actionOnPressed,
  }) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: AutoSizeText(
                questionText,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            const Sizer.qtrHor(),
            Flexible(
              child: FlatButton(
                onPressed: actionOnPressed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  actionText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
