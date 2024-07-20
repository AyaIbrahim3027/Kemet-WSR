import 'package:flutter/material.dart';

import '../resources/app_style.dart';

AppBar buildAppBar({required String text}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      text,
      style: AppStyles.styleSemiBold20(),
    ),
  );
}
