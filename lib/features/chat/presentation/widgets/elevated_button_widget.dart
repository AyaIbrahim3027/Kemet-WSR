import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import '../../../../app/app_router.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.name,
    required this.contextName,
    required this.query,
  });

  final String name;
  final String contextName;
  final dynamic query;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        GoRouter.of(context).push(
          AppRouter.kChatPage,
          extra: {
            'name': name,
            'contextName': contextName,
            'query': query,
          },
        );
      },
      child: Text('${StringsManager.chatWith} $name'),
    );
  }
}
