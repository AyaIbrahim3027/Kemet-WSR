// import 'package:flutter/material.dart';
// import '../../../../core/utils/resources/assets_manager.dart';
// import '../../../../core/utils/widgets/floating_action_button_widget.dart';
// import '../../../chat/presentation/widgets/showCharacterDialog.dart';
// import '../../data/models/statue_model.dart';
// import '../widgets/home_view_body_widget.dart';
//
// class HomeView extends StatelessWidget {
//   const HomeView({
//     super.key, this.statueModel,
//     // this.statueModel,
//   });
//
//   // static final statueModel = StatueModel(
//   //   image:
//   //       'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
//   //   name: 'character',
//   //   epoch: '1',
//   //   civilizationName: '1',
//   //   ar: '1',
//   //   ai: '',
//   // );
//   final StatueModel? statueModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           body: const HomeViewBodyWidget(),
//           floatingActionButton: FloatingActionButtonWidget(
//             onPressed: () {
//               showCharacterDialog(context, statueModel!);
//             },
//             icon: AssetsManager.chatIcon,
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/utils/resources/assets_manager.dart';
// import '../../../../core/utils/widgets/floating_action_button_widget.dart';
// import '../../../chat/presentation/widgets/showCharacterDialog.dart';
// import '../manager/statue/statue_cubit.dart';
// import '../widgets/home_view_body_widget.dart';
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           body: BlocBuilder<StatueCubit, StatueState>(
//             builder: (context, state) {
//               if (state is StatueLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (state is StatueSuccess) {
//                 return HomeViewBodyWidget(statues: state.statues);
//               } else if (state is StatueFailure) {
//                 return Center(child: Text('Error: ${state.errorMsg}'));
//               } else {
//                 return const Center(child: Text('No statues found.'));
//               }
//             },
//           ),
//           floatingActionButton: FloatingActionButtonWidget(
//             onPressed: () {
//               final statueCubit = context.read<StatueCubit>();
//               final currentState = statueCubit.state;
//               if (currentState is StatueSuccess &&
//                   currentState.statues.isNotEmpty) {
//                 showCharacterDialog(context, currentState.statues[0]);
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                       content: Text('No statues available or data not loaded')),
//                 );
//               }
//             },
//             icon: AssetsManager.chatIcon,
//           ),
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../../../chat/presentation/widgets/showCharacterDialog.dart';
import '../manager/statue/statue_cubit.dart';
import '../widgets/home_view_body_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: BlocBuilder<StatueCubit, StatueState>(
                builder: (context, state) {
                  if (state is StatueLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is StatueSuccess) {
                    return const HomeViewBodyWidget();
                  } else if (state is StatueFailure) {
                    return Center(child: Text('Error: ${state.errorMsg}'));
                  } else {
                    return const Center(child: Text('No statues found.'));
                  }
                },
              ),
              floatingActionButton: FloatingActionButtonWidget(
                onPressed: () {
                  final statueCubit = context.read<StatueCubit>();
                  final currentState = statueCubit.state;
                  if (currentState is StatueSuccess && currentState.statues.isNotEmpty) {
                    showCharacterDialog(context, currentState.statues); // Pass all statues here
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No statues available or data not loaded')),
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
