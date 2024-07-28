import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kemetwsr/features/home/presentation/widgets/statue_list_widget.dart';
import 'package:kemetwsr/features/home/presentation/widgets/vr_section_widget.dart';
import 'package:kemetwsr/features/home/presentation/widgets/welcome_text_widget.dart';
import 'package:kemetwsr/features/search/presentation/views/search_view.dart';
import '../../../../core/utils/resources/values_manager.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeTextWidget(),
                SizedBox(
                  height: AppSize.s20,
                ),
                SearchView(),
                SizedBox(
                  height: AppSize.s20,
                ),
                StatueListWidget(),
                VRSectionWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
