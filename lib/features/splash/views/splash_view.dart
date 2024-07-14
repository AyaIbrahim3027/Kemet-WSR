import 'package:flutter/material.dart';
import 'package:kemetwsr/features/splash/widgets/splash_view_body_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBodyWidget(),
    );
  }
}
