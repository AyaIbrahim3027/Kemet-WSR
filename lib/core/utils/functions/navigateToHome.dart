import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/app_router.dart';

navigateToHome(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 5));
  GoRouter.of(context).push(AppRouter.kHomeView);
}
