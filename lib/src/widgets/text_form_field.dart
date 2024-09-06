import 'package:base_flutter_app/src/configs/resources/barrel_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.maxLength,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.inputFormatters,
    this.onTapOutside,
    this.onEditingComplete,
    this.readOnly = false,
    this.hintText = '',
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.textStyle,
    this.labelText,
  });
  final int? maxLength;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Function? onTapOutside;
  final Function? onEditingComplete;
  final bool readOnly;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? textStyle;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      style: textStyle ?? AppFont.medium(color: AppColor.black),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
        onTapOutside?.call();
      },
      onEditingComplete: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onEditingComplete?.call();
      },
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        counterText: '',
        fillColor: fillColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
