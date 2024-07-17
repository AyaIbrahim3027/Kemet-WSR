import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../features/home/data/statue_service/statue_service.dart';
import '../features/home/presentation/manager/statue/statue_cubit.dart';
import '../features/home/presentation/views/home_view.dart';
import '../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) => StatueCubit(
            StatueService(),
          )..fetchStatues(),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
