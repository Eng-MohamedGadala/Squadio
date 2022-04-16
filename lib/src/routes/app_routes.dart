import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:squadio/src/features/People/presentation/people_detils_screen.dart';
import 'package:squadio/src/features/People/presentation/people_screen.dart';
import 'package:squadio/src/features/root/presentation/root_screen.dart';

class Routing extends StatelessWidget {
  Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
               const RootScreen()),
      GoRoute(
        path: '/people',
        routes: [
          GoRoute(
            path: '/peopleDetils',
            builder: (BuildContext context, GoRouterState state) =>
                const PeopleDetils(),
          ),
        ],
        builder: (BuildContext context, GoRouterState state) =>
            const PeopleScreen(),
      ),
    ],
  );
}
