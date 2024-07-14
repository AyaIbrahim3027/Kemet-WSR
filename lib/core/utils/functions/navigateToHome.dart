import 'package:flutter/material.dart';
import '../../../features/home/views/home_view.dart';

navigateToHome(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 5));
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HomeView()),
  );
}
