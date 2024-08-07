import 'package:flutter/material.dart';

import '../resources/app_style.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

AppBar buildAppBar({required String text , required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      text,
      style: AppStyles.styleSemiBold22(context).copyWith(
        color: ColorManager.black.withOpacity(AppOpacity.op0_8),
      ),
    ),
  );
}
