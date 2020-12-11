import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shaimaa_fudiyo/src/theme/colors.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    TextEditingController controller,
    FocusNode node,
    ValueChanged<String> onChange,
    VoidCallback onComplete,
    VoidCallback onTap,
    FormFieldValidator<String> validator,
    String hint,
    String label,
    String error,
    TextInputType keyType,
    TextInputAction inputAction = TextInputAction.done,
    TextCapitalization capitalization = TextCapitalization.none,
    bool autoFocus = false,
    IconData icon,
    Widget suffixIcon,
    Function(String) onFieldSubmitted,
    bool obscure = false,
    int maxLines = 1,
    List<TextInputFormatter> inputFormatters,
    FormFieldSetter<String> onSaved,
    TextDirection textDirection,
    TextAlign textAlign,
    Iterable<String> autofillHints,
    bool inputShouldBeLeft,
  })  : assert(label != null),
        super(
          autofillHints: autofillHints,
          autofocus: autoFocus,
          controller: controller,
          cursorColor: chineseViolet,
          focusNode: node,
          keyboardType: keyType,
          textInputAction: inputAction,
          textCapitalization: capitalization,
          obscureText: obscure,
          onChanged: onChange,
          onTap: onTap,
          validator: validator,
          onEditingComplete: onComplete,
          onSaved: onSaved,
          style: CustomStyle(color: chineseViolet),
          maxLines: maxLines,
          onFieldSubmitted: onFieldSubmitted,
          decoration: CustomDecoration(
            label: label,
            hint: hint,
            error: error,
            fieldIcon: icon,
            suffixIcon: suffixIcon,
            inputShouldBeLeft: inputShouldBeLeft,
          ),
          inputFormatters: inputFormatters,
          textDirection: textDirection,
          textAlign: textAlign,
        );
}

class CustomStyle extends TextStyle {
  CustomStyle({Color color, double fontSize})
      : super(
          color: color ?? mellow,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
          fontSize: fontSize,
        );

  CustomStyle.medium({Color color, double fontSize})
      : super(
          color: color ?? chineseViolet,
          fontWeight: FontWeight.w500,
          fontFamily: 'Cairo',
          fontSize: fontSize,
        );

  CustomStyle.hint({Color color, double fontSize})
      : super(
          color: color ?? mellow,
          fontWeight: FontWeight.normal,
          fontFamily: 'Cairo',
          fontSize: fontSize,
        );
}

class CustomDecoration extends InputDecoration {
  CustomDecoration({
    String label,
    String hint,
    String error,
    IconData fieldIcon,
    Widget suffixIcon,
    bool inputShouldBeLeft,
  })  : assert(label != null),
        super(
          border: const OutlineInputBorder(),
          contentPadding: suffixIcon == null
              ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0)
              : const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 80),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.0),
            borderSide: BorderSide(
              color: gray,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.0),
            borderSide: BorderSide(
              color: gray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36.0),
              borderSide: BorderSide(
                color: gray,
                width: 2.0,
              )),
          hintText: hint,
          hintStyle: CustomStyle.hint(color: chineseViolet),
          labelText: label,
          labelStyle: CustomStyle.medium(color: chineseViolet),
          prefixIcon:
              fieldIcon != null ? Icon(fieldIcon, color: chineseViolet) : null,
          errorText: error,
          errorMaxLines: 2,
          alignLabelWithHint: true,
          suffixIcon: suffixIcon != null ? suffixIcon : null,
        );
}
