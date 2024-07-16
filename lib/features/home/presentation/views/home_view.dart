import 'package:flutter/material.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../widgets/home_view_body_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomeViewBodyWidget(),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}

