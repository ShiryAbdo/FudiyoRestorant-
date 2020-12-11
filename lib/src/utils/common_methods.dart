import 'package:flutter/material.dart';

VoidCallback dismissKeyboard(BuildContext context) {
  return () {
    FocusScope.of(context).unfocus();
  };
}


