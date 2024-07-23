import 'package:flutter/material.dart';
import 'color_manager.dart';

abstract class AppStyles {
  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleMedium15(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold17(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleSemiBold17(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold22(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleSemiBold23(BuildContext context) {
    return TextStyle(
      color: ColorManager.black,
      fontSize: getResponsiveFontSize(context, fontSize: 23),
      fontWeight: FontWeight.w600,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  return width / 450;
}
