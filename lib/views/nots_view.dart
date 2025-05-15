import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/views/widgets/add_nots_bottom_sheet.dart';
import 'package:note_app/views/widgets/nots_view_body.dart';

class notsView extends StatelessWidget {
  const notsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (innerContext){
        return FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape:RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(32)
            ),context: innerContext, builder:(context){

              return notsAddBottomSheet(notesCubit: BlocProvider.of<NotesCubit>(innerContext));

            });
          },
          child: Icon(Icons.add),
        );}
      ),
      body: notsViewBody(),
    );
  }
}
