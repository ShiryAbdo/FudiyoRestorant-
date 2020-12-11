import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:shaimaa_fudiyo/src/widgets/text_field_widgets/custom_text_field.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChange;
  final VoidCallback onComplete;
  final VoidCallback onTap;
  final Function(String) onFieldSubmitted;
  final FormFieldValidator<String> validator;
  final String hint;
  final String label;
  final String error;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final IconData icon;
  final Widget suffixIcon;
  final TextCapitalization capitalization;
  final bool autoFocus;
  final bool obscure;
  final int maxLines;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldSetter<String> onSaved;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final Iterable<String> autofillHints;

  AppTextField({
    Key key,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.label,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.onComplete,
    this.onTap,
    this.validator,
    this.hint,
    this.error,
    this.autoFocus,
    this.icon,
    this.obscure = false,
    this.inputAction,
    this.capitalization,
    this.maxLines,
    this.inputFormatters,
    this.onSaved,
    this.textDirection,
    this.autofillHints,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputShouldBeLeft = keyboardType == TextInputType.emailAddress ||
        keyboardType == TextInputType.phone ||
        obscure;
    return CustomTextFormField(
      autofillHints: this.autofillHints,
      controller: controller,
      node: focusNode,
      onChange: onChange,
      onComplete: onComplete,
      onTap: onTap,
      validator: this.validator,
      hint: hint,
      label: label,
      error: error,
      keyType: keyboardType,
      inputAction: inputAction,
      capitalization:
          capitalization != null ? capitalization : TextCapitalization.none,
      autoFocus: autoFocus != null ? autoFocus : false,
      icon: icon,
      suffixIcon: suffixIcon,
      obscure: obscure,
      onSaved: onSaved,
      maxLines: obscure ? 1 : maxLines,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      textDirection: inputShouldBeLeft ? TextDirection.ltr : textDirection,
      textAlign: inputShouldBeLeft ? TextAlign.left : textAlign,
      inputShouldBeLeft: inputShouldBeLeft,
    );
  }
}
