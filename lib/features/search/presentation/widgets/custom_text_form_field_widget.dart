import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/values_manager.dart';
import '../../../../core/utils/resources/app_style.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.textColor,
    this.textStyle,
    this.hintText,
    this.controller,
    this.fillColor,
    this.prefixIcon,
    this.onChanged,
    this.borderRadius,
    this.suffixIcon, this.onTap,
  });

  final Color? textColor;
  final TextStyle? textStyle;
  final String? hintText;
  final TextEditingController? controller;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final BorderRadius? borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: textStyle ??
            AppStyles.styleMedium14(context).copyWith(
              color:
                  textColor ?? ColorManager.black.withOpacity(AppOpacity.op0_7),
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius ?? BorderRadius.circular(AppSize.s10),
        ),
      ),
    );
  }
}
