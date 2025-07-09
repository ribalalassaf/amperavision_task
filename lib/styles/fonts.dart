import 'package:flutter/material.dart';
import 'package:ampera_vision_test/styles/colors.dart';

class FontStyles {
  static TextStyle regularStyle({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: fontSize, color: color, decoration: textDecoration);
  static TextStyle lightStyle({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontWeight: FontWeight.w300, fontSize: fontSize, color: color, decoration: textDecoration);
  static TextStyle mediumStyle({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: fontSize, color: color, decoration: textDecoration);
  static TextStyle semiboldStyle({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize, color: color, decoration: textDecoration);
  static TextStyle boldStyle({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: fontSize, color: color, decoration: textDecoration);

  static TextStyle extraBoldStyle({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontWeight: FontWeight.w800, fontSize: fontSize, color: color, decoration: textDecoration);
  static TextStyle bison({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontWeight: FontWeight.w300, fontSize: fontSize, color: color, decoration: textDecoration);

  static TextStyle masheen({double? fontSize, Color color = AppColors.white, TextDecoration? textDecoration}) =>
      TextStyle(fontSize: fontSize, color: color, decoration: textDecoration);
}
