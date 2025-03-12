import 'package:flutter/material.dart';
import 'package:note_sphere/utils/constants.dart';
import 'package:note_sphere/utils/text_styles.dart';
import 'package:note_sphere/widgets/note_to_do_card.dart';
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
            SizedBox(height: AppConstants.kDefaultPadding),
            ProgressCard(
              completedTasks: 5,
              totalTasks: 5,
            ),
            SizedBox(height: AppConstants.kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotesTodoCard(
                  title: 'Notes',
                  description: "3 Notes",
                  icon: Icons.bookmark_add_outlined,
                ),
                NotesTodoCard(
                  title: 'To-Do List',
                  description: "3 Tasks",
                  icon: Icons.today_outlined,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Progress",
                  style: AppTextStyles.appSubtitle,
                ),
                Text(
                  "See All",
                  style: AppTextStyles.appButton,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
