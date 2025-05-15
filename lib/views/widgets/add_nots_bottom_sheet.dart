import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note_cubit.dart';
import 'package:note_app/views/widgets/add_note%20_form.dart';
import 'package:note_app/views/widgets/custm_text_field.dart';
import 'package:note_app/views/widgets/custom_button.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';

class notsAddBottomSheet extends StatelessWidget {
  const notsAddBottomSheet({super.key,required this.notesCubit});
  final NotesCubit notesCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state is AddNoteLoading?true:false,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24,right: 24,top: 24,bottom: MediaQuery.of(context).viewInsets.bottom),

                    child: SingleChildScrollView(child: addFormNots()),
                  ),
                );
              }, listener: (context, state) {
                if (state is AddNoteFailure) {
      print('failure${state.errMessege}');
                }
                if (state is AddNoteSuccess) {
                  notesCubit.fetchAllNotes();
                  Navigator.pop(context);
                }
              }),
    );
  }
}
