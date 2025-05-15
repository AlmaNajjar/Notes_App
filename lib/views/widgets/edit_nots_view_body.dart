import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custm_text_field.dart';

import 'custom_appbar.dart';

class editNotsViewBody extends StatefulWidget {
  const editNotsViewBody({super.key, required this.note});
final NoteModel note;

  @override
  State<editNotsViewBody> createState() => _editNotsViewBodyState();
}

class _editNotsViewBodyState extends State<editNotsViewBody> {
  String? title,content;
  @override

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          customAppBar(
            onPressed: (){
              widget.note.title=title??widget.note.title;
              widget.note.subtitle=content??widget.note.subtitle;
              widget.note.save();
BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            text: 'Edit Note',
            icons: Icons.check,
          ),
          SizedBox(height: 50,),
          customTextField(
              onChanged: (value){
                title=value;

              },
              hint: widget.note.title, maxLine: 1),
          SizedBox(height: 24,),
          customTextField(
              onChanged: (value){
                content=value;
              },
              hint:widget.note.subtitle, maxLine: 5)
        ]));
  }
}
