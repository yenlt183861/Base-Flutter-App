import 'package:flutter/material.dart';

class TextUtil {
  /// get the size of a text
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
      ..layout(
        minWidth: 0,
        maxWidth: maxWidth ?? double.maxFinite,
      );
    return textPainter.size;
  }

  /// get the line number of a text
  static int getNumberLines(
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
      ..layout(
        minWidth: 0,
        maxWidth: maxWidth ?? double.maxFinite,
      );
    return textPainter.computeLineMetrics().length;
  }
}
