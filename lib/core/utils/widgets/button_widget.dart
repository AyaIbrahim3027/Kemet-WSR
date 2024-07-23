import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/app_style.dart';

import '../resources/values_manager.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.actionButton,
  });

  final String text;
  final Widget actionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppStyles.styleMedium14(context),
        ),
        const SizedBox(width: AppSize.s20),
        actionButton,
      ],
    );
  }
}
