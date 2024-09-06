// ignore_for_file: no_logic_in_create_state

import 'package:base_flutter_app/src/utils/barrel_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'tap_area.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.title = 'OK',
    this.onTap,
    this.onLongTap,
    this.width,
    this.textStyle,
    this.boxDecoration,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.colorBorder,
    this.tapAreaStyle,
  });
  final String title;

  final VoidCallback? onTap;
  final VoidCallback? onLongTap;

  final double? width;
  final TextStyle? textStyle;

  final BoxDecoration? boxDecoration;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? colorBorder;

  /// style for Tap area Web
  final TapAreaStyle? tapAreaStyle;

  @override
  Widget build(BuildContext context) {
    return TapArea(
      onTap: onTap,
      onLongTap: onLongTap,
      tapAreaStyle: tapAreaStyle,
      borderRadius: borderRadius ?? appDefaultBorderRadius,
      backgroundColor: backgroundColor,
      child: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: width,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: boxDecoration ??
              BoxDecoration(
                borderRadius: borderRadius ?? appDefaultBorderRadius,
                color: defaultTargetPlatform == TargetPlatform.android
                    ? Colors.transparent
                    : backgroundColor,
                border: Border.all(
                  color: colorBorder ?? Colors.transparent,
                ),
              ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
