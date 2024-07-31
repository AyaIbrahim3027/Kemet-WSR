import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/app_style.dart';
import 'package:kemetwsr/core/utils/resources/values_manager.dart';
import 'package:kemetwsr/features/chat/presentation/widgets/character_item_widget.dart';
import '../../../../core/utils/resources/data.dart';
import '../../../home/data/models/statue_model.dart';

class CharacterDialog extends StatelessWidget {
  final StatueModel? statueModel;

  const CharacterDialog({
    super.key,
    this.statueModel,
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
              'Select a Character',
              style: AppStyles.styleSemiBold20(context),
            ),
            const SizedBox(height: AppSize.s20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: figures.entries.map((entry) {
                  final name = entry.key;
                  final data = entry.value;
                  final contextName = data;
                  final query =
                  all_historical_figures[name]?["responses"];
                  return CharacterItemWidget(
                    name: name,
                    image: statueModel?.image ?? '',
                    // statueModel: statueModel,
                    contextName: contextName,
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
