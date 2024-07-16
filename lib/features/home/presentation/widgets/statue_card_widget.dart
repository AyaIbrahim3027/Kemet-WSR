import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kemetwsr/core/utils/resources/app_style.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/values_manager.dart';
import '../../data/models/statue_model.dart';

class StatueCardWidget extends StatelessWidget {
  const StatueCardWidget({
    super.key,
    required this.statueModel,
  });

  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      color: ColorManager.beige.withOpacity(AppOpacity.op0_3),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Image.network(
            //     statueModel.image,
            //     height: 100,
            //   ),
            // ),
            const SizedBox(height: AppSize.s16),
            Text(
              statueModel.name,
              style: AppStyles.styleSemiBold17(),
              maxLines: 2,
            ),
            const SizedBox(height: AppSize.s8),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.buildingColumns,
                  size: AppSize.s16,
                ),
                const SizedBox(width: AppSize.s8),
                Text(
                  'statueModel.civilizationName',
                  style: AppStyles.styleMedium15(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: AppSize.s8),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.clockRotateLeft,
                  size: AppSize.s16,
                ),
                const SizedBox(width: AppSize.s8),
                Text(
                  statueModel.epoch,
                  style: AppStyles.styleMedium15(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
