

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class InputDoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: CupertinoButton(
            padding: EdgeInsetsDirectional.only(end: 24.0, top: 8.0, bottom: 8.0),
            onPressed: () {
              FocusScope.of(context).unfocus();
            },
            child: Text(
              tr('ok'),
              style: TextStyle(
                color: CupertinoTheme.of(context).textTheme.actionTextStyle.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
