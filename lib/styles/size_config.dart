import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static const _height = 932;
  static const _width = 430;
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static double getRelativeHeight(double size) => (size * screenHeight) / _height;
  static double getRelativeWidth(double size) => (size * screenWidth) / _width;
  static double getWidthPercent(double size) => (getRelativeWidth(size) / screenWidth);
}
