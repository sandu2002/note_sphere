import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_sphere/pages/home_page.dart';
import 'package:note_sphere/pages/notes_by_category.dart';
import 'package:note_sphere/pages/notes_page.dart';
import 'package:note_sphere/pages/todo_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: false,
    initialLocation: '/',
    routes: [
      // Home Page route
      GoRoute(
        name: "home",
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),

      //notes page
      GoRoute(
        name: "notes",
        path: '/notes',
        builder: (context, state) {
          return const NotesPage();
        },
      ),

      //notes page
      GoRoute(
        name: "todos",
        path: '/todos',
        builder: (context, state) {
          return const TodoPage();
        },
      ),

      //notes by category page
      GoRoute(
        name: "category",
        path: '/category',
        builder: (context, state) {
          final String category = state.extra as String;
          return NotesByCategoryPage(category: category);
        },
      ),
    ],
  );
}
