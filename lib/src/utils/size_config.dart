// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double paddingBottom = 0.0;
  static bool isVerticalScreen = false;

  static double buttonHeightDefault = 40;
  static double textFieldHeightDefault = 80;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    paddingBottom = _mediaQueryData.padding.bottom;
    isVerticalScreen = _mediaQueryData.orientation == Orientation.portrait;
  }
}

final double appDefaultPadding = getProportionateScreenHeight(16);
const appDefaultBorderRadius = BorderRadius.all(Radius.circular(8));

/// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  final screenHeight = SizeConfig.screenHeight;
  // Our designer use iPhone 11, that's why we use 896.0
  return (inputHeight / 896.0) * screenHeight;
}

/// Get the proportionate width as per screen size
double getProportionateScreenWidth(double inputWidth) {
  final screenWidth = SizeConfig.screenWidth;
  // 414 is the layout width that designer use or you can say iPhone 11  width
  return (inputWidth / 414.0) * screenWidth;
}

class GapH extends StatelessWidget {
  const GapH([this.of = 20]);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(of),
    );
  }
}

class GapW extends StatelessWidget {
  const GapW([this.of = 20]);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(of),
    );
  }
}

/// For add free space vertically
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    super.key,
    this.of = 20,
  });

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(of),
      width: double.maxFinite,
    );
  }
}

/// For add free space horizontally
class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({
    super.key,
    this.of = 20,
  });

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(of),
    );
  }
}
