import 'package:flutter/material.dart';
import '../../../core/utils/resources/app_style.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../core/utils/resources/values_manager.dart';

class VRSectionWidget extends StatelessWidget {
  const VRSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0,-50),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.soon,
              style: AppStyles.styleSemiBold20(),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration:  BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(AppSize.s10)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
