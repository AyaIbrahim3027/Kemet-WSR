import 'package:flutter/material.dart';
import 'package:kemetwsr/features/home/widgets/home_view_body_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomeViewBodyWidget(),
      ),
    );
  }
}
