import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/values_manager.dart';
import 'package:kemetwsr/features/home/presentation/widgets/statue_info_widget.dart';
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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            StatueInfoWidget(statueModel: statueModel),
            Positioned(
              top: -100,
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.height * 0.17,
                  child: Image.network(
                    statueModel.image,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
