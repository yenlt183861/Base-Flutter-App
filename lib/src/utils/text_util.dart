import 'package:flutter/material.dart';

/**
 * double.maxFinite: represents the maximum-allowed value that the double data type can contain
 */

class TextUtil {
  static Size getTextSize(
      {String text = '',
      TextStyle? textStyle,
      TextDirection textDirection = TextDirection.ltr,
      double? maxWidth}) {
    final textPainter = TextPainter(
        text: TextSpan(
      text: text,
      style: textStyle,
    ))
      ..textDirection = textDirection
      ..layout(maxWidth: maxWidth ?? double.maxFinite);
    return textPainter.size;
  }
}
