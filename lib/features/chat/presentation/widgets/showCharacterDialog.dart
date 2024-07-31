import 'package:flutter/material.dart';
import '../../../home/data/models/statue_model.dart';
import 'character_dialog.dart';

// final List<Map<String, String>> characters = [
//   {'name': 'Character 1', 'image': 'https://via.placeholder.com/150'},
//   {'name': 'Character 2', 'image': 'https://via.placeholder.com/150'},
//   {'name': 'Character 3', 'image': 'https://via.placeholder.com/150'},
//   {'name': 'Character 3', 'image': 'https://via.placeholder.com/150'},
//   {'name': 'Character 3', 'image': 'https://via.placeholder.com/150'},
//   {'name': 'Character 3', 'image': 'https://via.placeholder.com/150'},
//   {'name': 'Character 3', 'image': 'https://via.placeholder.com/150'},
//   {'name': 'Character 3', 'image': 'https://via.placeholder.com/150'},
//   // Add more characters here
// ];

// final StatueModel statues;

void showCharacterDialog(BuildContext context , StatueModel statueModel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return  CharacterDialog(statueModel: statueModel,);
    },
  );
}
