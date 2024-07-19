import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.beige,
        backgroundColor: ColorManager.black,
      ),
    );
  }
}
