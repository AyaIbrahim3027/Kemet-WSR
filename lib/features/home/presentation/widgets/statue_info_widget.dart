import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/app_style.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../data/models/statue_model.dart';

class StatueInfoWidget extends StatelessWidget {
  const StatueInfoWidget({
    super.key,
    required this.statueModel,
  });

  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            statueModel.name,
            style: AppStyles.styleSemiBold19(context)
                .copyWith(color: ColorManager.lightBeige),
            maxLines: 2,
          ),
          const SizedBox(height: AppSize.s8),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.buildingColumns,
                size: AppSize.s16,
                color: ColorManager.lightBeige,
              ),
              const SizedBox(width: AppSize.s8),
              Text(
                statueModel.civilizationName,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: ColorManager.lightBeige),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: AppSize.s6),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.clockRotateLeft,
                size: AppSize.s16,
                color: ColorManager.lightBeige,
              ),
              const SizedBox(width: AppSize.s8),
              Text(
                statueModel.epoch,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: ColorManager.lightBeige),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
