import 'package:flutter/material.dart';
import '../../../home/data/models/statue_model.dart';
import 'character_dialog.dart';

void showCharacterDialog(BuildContext context, List<StatueModel> statues) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CharacterDialog(
        statues: statues,
      );
    },
  );
}
