import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
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
  });

  final String name;
  final String contextName;
  final String image;
  final dynamic query;

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
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
        child: Column(
          children: [
            CircleAvatar(
              radius: AppSize.s30,
              backgroundColor:
                  ColorManager.black.withOpacity(AppOpacity.op0_02),
              backgroundImage: NetworkImage(
                image,
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              name,
              style: AppStyles.styleMedium14(context).copyWith(
                  color: ColorManager.brown.withOpacity(AppOpacity.op0_9)),
            ),
          ],
        ),
      ),
    );
  }
}
