import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/nots_view.dart';
import 'package:note_app/views/widgets/custom_appbar.dart';
import 'package:note_app/views/widgets/note_item.dart';
import 'package:note_app/views/widgets/nots_listview.dart';

class notsViewBody extends StatefulWidget {
  notsViewBody({super.key});

  @override
  State<notsViewBody> createState() => _notsViewBodyState();
}

class _notsViewBodyState extends State<notsViewBody> {
void initState(){
  super.initState();
  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
}




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          customAppBar(text: 'Notes',icons: Icons.search,),
          Expanded(child: notesListView())
        ],
      ),
    );
  }
}
