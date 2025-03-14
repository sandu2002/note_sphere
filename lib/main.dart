import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_sphere/models/note_model.dart';
import 'package:note_sphere/models/todo_model.dart';
import 'package:note_sphere/utils/router.dart';
import 'package:note_sphere/utils/theme_data.dart';

void main() async {
  //initialize the hive
  await Hive.initFlutter();

  //adapters registration
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(ToDoAdapter());

  //open hive boxes
  await Hive.openBox('notes');
  await Hive.openBox('todos');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Note Sphere",
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme.copyWith(
        textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
