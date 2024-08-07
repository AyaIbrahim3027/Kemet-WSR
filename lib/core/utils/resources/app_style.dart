import 'package:flutter/material.dart';
import 'color_manager.dart';

abstract class AppStyles {
  static TextStyle styleRegular(BuildContext context, double fontSize) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleMedium(BuildContext context, double fontSize) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleBold(BuildContext context, double fontSize) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleSemiBold(BuildContext context, double fontSize) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium14(BuildContext context) =>
      styleMedium(context, 14);
  static TextStyle styleBold14(BuildContext context) => styleBold(context, 14);
  static TextStyle styleRegular15(BuildContext context) =>
      styleRegular(context, 15);
  static TextStyle styleMedium15(BuildContext context) =>
      styleMedium(context, 15);
  static TextStyle styleMedium16(BuildContext context) =>
      styleMedium(context, 16);
  static TextStyle styleBold16(BuildContext context) => styleBold(context, 16);
  static TextStyle styleRegular17(BuildContext context) =>
      styleRegular(context, 17);
  static TextStyle styleBold17(BuildContext context) => styleBold(context, 17);
  static TextStyle styleSemiBold17(BuildContext context) =>
      styleSemiBold(context, 17);
  static TextStyle styleMedium18(BuildContext context) =>
      styleMedium(context, 18);
  static TextStyle styleBold18(BuildContext context) => styleBold(context, 18);
  static TextStyle styleSemiBold19(BuildContext context) =>
      styleSemiBold(context, 19);
  static TextStyle styleSemiBold20(BuildContext context) =>
      styleSemiBold(context, 20);
  static TextStyle styleBold22(BuildContext context) => styleBold(context, 22);
  static TextStyle styleSemiBold22(BuildContext context) =>
      styleSemiBold(context, 22);
  static TextStyle styleSemiBold23(BuildContext context) =>
      styleSemiBold(context, 23);
  static TextStyle styleSemiBold25(BuildContext context) =>
      styleSemiBold(context, 25);
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.5;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 360) {
    // Small devices
    return width / 320;
  } else if (width < 600) {
    // Medium devices
    return width / 420;
  } else {
    // Large devices
    return width / 450;
  }
}
