import 'package:flutter/material.dart';
import 'package:note_sphere/models/note_model.dart';
import 'package:note_sphere/services/note_services.dart';
import 'package:note_sphere/utils/constants.dart';
import 'package:note_sphere/utils/router.dart';
import 'package:note_sphere/utils/text_styles.dart';
import 'package:note_sphere/widgets/note_category_card.dart';

class NotesByCategoryPage extends StatefulWidget {
  final String category;
  const NotesByCategoryPage({
    super.key,
    required this.category,
  });

  @override
  State<NotesByCategoryPage> createState() => _NotesByCategoryPageState();
}

class _NotesByCategoryPageState extends State<NotesByCategoryPage> {
  List<Note> noteList = [];
  @override
  void initState() {
    _loadCategoriesNotes();
    super.initState();
  }

  Future<void> _loadCategoriesNotes() async {
    final noteService = NoteServices();
    noteList = await noteService.getNotesByCategory(widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // go to the notes page
            AppRouter.router.push("/notes");
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppConstants.kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.category,
                style: AppTextStyles.appTitle,
              ),
              const SizedBox(
                height: 30,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.kDefaultPadding,
                  mainAxisSpacing: AppConstants.kDefaultPadding,
                  childAspectRatio: 7 / 11,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return NoteCategoryCard(
                    noteTitle: noteList[index].title,
                    noteContent: noteList[index].content,
                    removeNote: () async {},
                    editNote: () async {},
                    viewSingleNote: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
