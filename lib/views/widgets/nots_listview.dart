import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/note_item.dart';

class notesListView extends StatelessWidget {
  const notesListView({super.key});
final data =const[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context,state){
        List<NoteModel>notes=BlocProvider.of<NotesCubit>(context).notes??[];
      return ListView.builder(
        itemCount:notes.length ,

        itemBuilder:(context,index){return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: noteItem(note:notes[index]),
      );},);}
    );
  }
}
