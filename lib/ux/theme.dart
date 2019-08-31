import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightNormal = FontWeight.w400;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightBold = FontWeight.w700;

  static const colorContrasting = Colors.white;
  static const colorAccent = colorGreen;
  static const colorBackground = Color(0xFF0A161B);
  static const colorGreen = Color(0xFF1CCD64);

  static CupertinoThemeData theme() {
    return const CupertinoThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colorBackground,
      primaryColor: colorGreen,
      primaryContrastingColor: colorContrasting,
      barBackgroundColor: colorBackground,
    );
  }
}
