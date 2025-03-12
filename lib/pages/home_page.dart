import 'package:flutter/material.dart';
import 'package:note_sphere/utils/text_styles.dart';
import 'package:note_sphere/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Note Sphere",
          style: AppTextStyles.appTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProgressCard(
              completedTasks: 5,
              totalTasks: 5,
            )
          ],
        ),
      ),
    );
  }
}
