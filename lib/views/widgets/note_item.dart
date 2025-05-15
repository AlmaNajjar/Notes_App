import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_nots_view.dart';

class noteItem extends StatelessWidget {
  const noteItem({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder:(context){
          return editNotsView(note: note,);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
                title: Text(
                 note.title,
                  style: TextStyle(color: Colors.black, fontSize: 26),
                ),
                subtitle: Text(
                   note.subtitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 20),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    ))),
            Text(
              note.date,
              style: TextStyle(color: Colors.black.withOpacity(.4),fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
