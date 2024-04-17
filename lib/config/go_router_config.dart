import 'package:concert_list_app/data/data_source/concert_api.dart';
import 'package:concert_list_app/data/repository/concert_repository_impl.dart';
import 'package:concert_list_app/presentation/concert_detail/concert_detail_screen.dart';
import 'package:concert_list_app/presentation/concert_detail/concert_detail_view_model.dart';
import 'package:concert_list_app/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GoRouterConfig {
  final GoRouter routerConfig = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return MainScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'concertDetail',
            builder: (BuildContext context, GoRouterState state) {
              return ChangeNotifierProvider(
                  create: (_) => ConcertDetailViewModel(
                    repository: ConcertRepositoryImpl(
                      api: ConcertApi()
                    )
                  ),
                  child: ConcertDetailScreen(
                    id: state.uri.queryParameters['id'] as String,
                    posterPath: state.uri.queryParameters['posterPath'] as String
                  )
              );
            },
          ),
        ],
      ),
    ],
  );
}