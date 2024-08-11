import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../../../../core/utils/widgets/progress_indicator_widget.dart';
import '../../../chat/presentation/widgets/showCharacterDialog.dart';
import '../manager/statue/statue_cubit.dart';
import '../widgets/home_view_body_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<StatueCubit, StatueState>(
          builder: (context, state) {
            if (state is StatueLoading) {
              return const Center(child: ProgressIndicatorWidget());
            } else if (state is StatueSuccess) {
              return const HomeViewBodyWidget();
            } else if (state is StatueFailure) {
              return Center(child: Text('Error: ${state.errorMsg}'));
            } else {
              return const Center(child: Text('No statues found.'));
            }
          },
        ),
        floatingActionButton: Transform.translate(
          offset: const Offset(0, -30),
          child: FloatingActionButtonWidget(
            onPressed: () {
              final statueCubit = context.read<StatueCubit>();
              final currentState = statueCubit.state;
              if (currentState is StatueSuccess &&
                  currentState.statues.isNotEmpty) {
                showCharacterDialog(
                    context, currentState.statues); // Pass all statues here
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('No statues available or data not loaded')),
                );
              }
            },
            icon: AssetsManager.chatIcon,
          ),
        ),
      ),
    );
  }
}
