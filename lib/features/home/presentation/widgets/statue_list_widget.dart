import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemetwsr/features/home/presentation/widgets/statue_card_widget.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../../core/utils/widgets/progress_indicator_widget.dart';
import '../manager/statue/statue_cubit.dart';

class StatueListWidget extends StatelessWidget {
  const StatueListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatueCubit, StatueState>(builder: (context, state) {
      if (state is StatueLoading) {
        return const ProgressIndicatorWidget();
      } else if (state is StatueSuccess) {
        return GridView.builder(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.statues.length,
          itemBuilder: (BuildContext context, int index) {
            final statue = state.statues[index];
            return StatueCardWidget(statueModel: statue);
          },
        );
      } else if (state is StatueFailure) {
        return Center(child: Text('Error: ${state.errorMsg}'));
      } else {
        return const Center(child: Text('No data'));
      }
    });
  }
}
