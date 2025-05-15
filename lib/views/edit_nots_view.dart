import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/edit_nots_view_body.dart';

class editNotsView extends StatelessWidget {
  const editNotsView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: editNotsViewBody(note: note,),
    );
  }
}
