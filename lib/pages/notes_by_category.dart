import 'package:flutter/material.dart';
import 'package:note_sphere/models/note_model.dart';
import 'package:note_sphere/services/note_services.dart';

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
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Center(
        child: Text(
          'fuck you bitch',
        ),
      ),
    );
  }
}
