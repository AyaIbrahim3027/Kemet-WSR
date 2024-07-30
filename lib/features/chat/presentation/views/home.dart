import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/utils/resources/data.dart';
import '../manager/chat/chat_bloc.dart';
import 'chat_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historical Figures Chat')),
      body: ListView(
        children: figures.entries.map((entry) {
          final name = entry.key;
          final data = entry.value;
          final contextName = data;
          final query = all_historical_figures[name]?["responses"];

          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: GetIt.instance
                        .get<ChatBloc>(instanceName: '${name}Bloc'),
                    child: ChatPage(
                      contextName: contextName,
                      query: query, // Initialize as needed
                    ),
                  ),
                ),
              );
            },
            child: Text('Chat with $name'),
          );
        }).toList(),
      ),
    );
  }
}
