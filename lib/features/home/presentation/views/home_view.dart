import 'package:flutter/material.dart';
import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../../../chat/presentation/widgets/showCharacterDialog.dart';
import '../../data/models/statue_model.dart';
import '../widgets/home_view_body_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    // required this.statueModel,
  });

  static final statueModel = StatueModel(
    image: 'https://example.com/character_image.jpg', name: 'character', epoch: '1', civilizationName: '1', ar: '1', ai: '',
  );
  // final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: const HomeViewBodyWidget(),
          floatingActionButton: FloatingActionButtonWidget(
            onPressed: () {
              showCharacterDialog(context, statueModel);
            },
            icon: AssetsManager.chatIcon,
          ),
        ),
      ),
    );
  }
}



