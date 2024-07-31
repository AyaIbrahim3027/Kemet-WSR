import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/app_router.dart';
import '../../../../core/utils/resources/app_style.dart';
import '../../../../core/utils/resources/values_manager.dart';

class CharacterItemWidget extends StatelessWidget {
  const CharacterItemWidget({
    super.key,
    required this.name,
     required this.image,
    required this.contextName,
    required this.query,
    // this.statueModel,
  });

  final String name;
  final String contextName;
  final String image;
  final dynamic query;
  // final StatueModel? statueModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kChatPage,
          extra: {
            'name': name,
            'contextName': contextName,
            'query': query,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: AppSize.s30,
              backgroundImage: NetworkImage(
                image ,
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              name,
              style: AppStyles.styleMedium14(context),
            ),
          ],
        ),
      ),
    );
  }
}
