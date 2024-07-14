import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/features/splash/views/splash_view.dart';

class KemetWSR extends StatelessWidget {
  const KemetWSR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.background,
      ),
      home: const SplashView(),
    );
  }
}
