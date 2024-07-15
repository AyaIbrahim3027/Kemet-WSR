import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import 'package:kemetwsr/features/home/widgets/custom_text_form_field_widget.dart';
import 'package:kemetwsr/features/home/widgets/welcome_text_widget.dart';
import '../../../core/utils/resources/values_manager.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeTextWidget(),
            const SizedBox(
              height: AppSize.s20,
            ),
            CustomTextFormFieldWidget(
              prefixIcon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: AppSize.s20,
              ),
              hintText: StringsManager.searchHintText,
              fillColor: ColorManager.beige.withOpacity(AppOpacity.op0_4),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
          ],
        ),
      ),
    );
  }
}
