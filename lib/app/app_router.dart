import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kemetwsr/features/chat/presentation/manager/chat/chat_bloc.dart';
import 'package:kemetwsr/features/chat/presentation/views/chat_page.dart';
import 'package:kemetwsr/features/home/presentation/views/details_view.dart';
import 'package:kemetwsr/features/search/presentation/views/search_view.dart';
import '../features/chat/presentation/views/chat_view.dart';
import '../features/home/data/models/statue_model.dart';
import '../features/home/data/statue_service/statue_service.dart';
import '../features/home/presentation/manager/statue/statue_cubit.dart';
import '../features/home/presentation/views/home_view.dart';
import '../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
  static const kSearchView = '/searchView';
  static const kChatView = '/chatView';
  static const kChatPage = '/chatPage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => StatueCubit(
      //       StatueService(),
      //     )..fetchStatues(),
      //     child: const HomeView(),
      //   ),
      // ),


      GoRoute(
          path: kHomeView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => StatueCubit(
                StatueService(),
              )..fetchStatues(), // Ensure statues are fetched when HomeView is built
              child: const HomeView(
              ),
            );
            },
          ),

      GoRoute(
        path: kDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => StatueCubit(
            StatueService(),
          )..fetchStatues(),
          child: DetailsView(
            statueModel: state.extra as StatueModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kChatView,
        builder: (context, state) {
          final name = state
              .extra; // Assuming the historical figure's name is passed as extra
          return BlocProvider(
            create: (context) =>
                GetIt.instance.get<ChatBloc>(instanceName: '${name}Bloc'),
            child:
                const ChatView(), // Pass any necessary parameters to Home if needed
          );
        },
      ),
      GoRoute(
        path: kChatPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final name = extra['name'];
          final contextName = extra['contextName'];
          final query = extra['query'];
          return BlocProvider(
            create: (context) =>
                GetIt.instance.get<ChatBloc>(instanceName: '${name}Bloc'),
            child: ChatPage(
              contextName: contextName,
              query: query,
              characterName: name,
            ),
          );
        },
      ),
    ],
  );
}
