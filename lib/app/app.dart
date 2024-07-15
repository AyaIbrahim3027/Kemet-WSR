import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'app_router.dart';

class KemetWSR extends StatelessWidget {
  const KemetWSR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.background,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
