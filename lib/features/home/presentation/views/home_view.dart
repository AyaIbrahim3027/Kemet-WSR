import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/app_router.dart';
import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../widgets/home_view_body_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: const HomeViewBodyWidget(),
          floatingActionButton: FloatingActionButtonWidget(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kChatView);
            },
            icon: AssetsManager.chatIcon,
          ),
        ),
      ),
    );
  }
}
