import 'package:flutter/material.dart';
import 'package:base_flutter_app/generated/fonts.gen.dart';


class AppFont {
  static TextStyle light({
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? FontFamily.sfProRegular,
      fontSize: fontSize ?? 16,
      color: color,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w300,
      decoration: textDecoration ?? TextDecoration.none,
      height: height,
    );
  }

  static TextStyle regular({
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? FontFamily.sfProRegular,
      fontSize: fontSize ?? 16,
      color: color,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: textDecoration ?? TextDecoration.none,
      height: height,
    );
  }

  static TextStyle medium({
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? FontFamily.sfProMedium,
      fontSize: fontSize ?? 16,
      color: color,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: textDecoration ?? TextDecoration.none,
      height: height,
    );
  }

  static TextStyle semiBold({
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? FontFamily.sfProBold,
      fontSize: fontSize ?? 16,
      color: color,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w600,
      decoration: textDecoration ?? TextDecoration.none,
      height: height,
    );
  }

  static TextStyle bold({
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? FontFamily.sfProBold,
      fontSize: fontSize ?? 16,
      color: color,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w700,
      decoration: textDecoration ?? TextDecoration.none,
      height: height,
    );
  }
}
