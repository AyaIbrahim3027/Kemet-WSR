import 'package:flutter/material.dart';

import '../../../../core/utils/resources/data.dart';
import 'elevated_button_widget.dart';

class ChatViewBodyWidget extends StatelessWidget {
  const ChatViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: figures.entries.map((entry) {
        final name = entry.key;
        final data = entry.value;
        final contextName = data;
        final query = all_historical_figures[name]?["responses"];
        return ElevatedButtonWidget(
            name: name, contextName: contextName, query: query);
      }).toList(),
    );
  }
}
