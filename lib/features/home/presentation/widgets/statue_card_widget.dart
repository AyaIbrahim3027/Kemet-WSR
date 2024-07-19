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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: const BoxDecoration(
            color: ColorManager.beige,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(AppSize.s10),
              top: Radius.circular(AppSize.s5),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0.5),
                blurRadius: 2,
              )
            ],
          ),
          child: StatueInfoWidget(statueModel: statueModel),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: ColorManager.black.withOpacity(0.02),
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          child: Transform.translate(
            offset: const Offset(0, -25),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Image.network(
                statueModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
