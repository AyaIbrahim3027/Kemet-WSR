import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter/material.dart';
import '../resources/color_manager.dart';

RotateFloatingActionButtonBuilder buildRotateFloatingActionButtonBuilder(
    {required IconData icon}) {
  return RotateFloatingActionButtonBuilder(
    child: Icon(
      icon,
      size: 20,
    ),
    foregroundColor: ColorManager.background,
    backgroundColor: ColorManager.beige.withOpacity(0.5),
    shape: const CircleBorder(),
  );
}
