import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart'
    show showCupertinoDialog, CupertinoAlertDialog, CupertinoDialogAction;
import 'package:flutter/material.dart';

VoidCallback logoutDiadebugPrint(
  BuildContext context, {
  @required VoidCallback onPressed,
  @required Function(dynamic) then,
}) {
  return () {
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text(tr('confirm_logout')),
                actions: <Widget>[
                  CupertinoDialogAction(
                    onPressed: onPressed,
                    child: Text(
                      tr('yes'),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      tr('no'),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              );
            },
          ).then(then)
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(tr('confirm_logout')),
                actions: <Widget>[
                  FlatButton(
                    onPressed: onPressed,
                    child: Text(
                      tr('yes'),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      tr('no'),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              );
            },
          ).then(then);
  };
}
