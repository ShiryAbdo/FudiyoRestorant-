import 'dart:io';
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaimaa_fudiyo/src/theme/colors.dart';

final complementLoader = Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(mellow),
  ),
);

final whiteLoader = Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  ),
);

final defaultLoader = Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(mellow),
  ),
);

void connectionErrBar(BuildContext context, {String message}) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      message ?? tr('check_connection'),
      style: TextStyle(color: Colors.white),
    ),
    duration: snackBarDuration,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
    backgroundColor: darkRed,
  ));
}

void showLoadingDialog(BuildContext context, bool isLoading) {
  final dialogContent = isLoading
      ? SingleChildScrollView(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: defaultLoader,
          ),
        )
      : null;
  Platform.isIOS
      ? showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return CupertinoAlertDialog(
              content: dialogContent,
            );
          },
        )
      : showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              content: dialogContent,
            );
          },
        );
}

Future<bool> hideLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
  return Future.value(true).then((value) {
    return;
  });
}

void showInfoLoadingDialog(BuildContext context, bool isLoading, {String title}) {
  final dialogContent = isLoading
      ? SingleChildScrollView(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: defaultLoader,
          ),
        )
      : null;
  final defaultFont =   'Cairo';
  final direction =   ui.TextDirection.ltr;
  Platform.isIOS
      ? showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: title != null
                  ? Text(
                      title,
                      textAlign: TextAlign.center,
                      textDirection: direction,
                      style: TextStyle(fontFamily: defaultFont),
                    )
                  : null,
              content: dialogContent,
            );
          },
        )
      : showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: title != null
                  ? Text(
                      title,
                      textAlign: TextAlign.center,
                      textDirection: direction,
                      style: TextStyle(fontFamily: defaultFont),
                    )
                  : null,
              content: dialogContent,
            );
          },
        );
}

void confirmationDialog(BuildContext context, String question, VoidCallback callback) {
  Platform.isIOS
      ? showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(title: Text(question), actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  return callback();
                },
                child: Text(
                  tr('yes'),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  tr('no'),
                ),
              ),
            ]);
          },
        )
      : showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(question),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    return callback();
                  },
                  child: Text(
                    tr('yes'),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    tr('no'),
                  ),
                ),
              ],
            );
          },
        );
}

const snackBarDuration = Duration(seconds: 2);

/// Same as [stateBar] but without [RepositoryResponse].
void stateBarMsg(BuildContext context, bool isSuccess, String message, {Color color}) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(message, style: const TextStyle(color: Colors.white)),
    duration: snackBarDuration,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
    ),
    backgroundColor: color ?? (isSuccess ? Colors.green : Colors.red),
  ));
}


/// Update Dialog
bool _updateDialogDisplayed = false;

