import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/app_style.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import 'package:kemetwsr/core/utils/resources/values_manager.dart';
import 'package:kemetwsr/features/chat/presentation/widgets/character_item_widget.dart';
import '../../../../core/utils/resources/data.dart';
import '../../../home/data/models/statue_model.dart';

class CharacterDialog extends StatelessWidget {
  final List<StatueModel> statues;
  const CharacterDialog({
    super.key,
    required this.statues,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        height: MediaQuery.of(context).size.height * 0.21,
        child: Column(
          children: [
            Text(
              StringsManager.chatFigure,
              style: AppStyles.styleSemiBold20(context).copyWith(
                color: ColorManager.brown,
              ),
            ),
            const SizedBox(height: AppSize.s20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: statues.map((statue) {
                  final name = statue.name;
                  final query = all_historical_figures[name]?["responses"];
                  final contextName = figures[name];
                  return CharacterItemWidget(
                    name: statue.name,
                    image: statue.image,
                    contextName: contextName.toString(),
                    query: query,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
