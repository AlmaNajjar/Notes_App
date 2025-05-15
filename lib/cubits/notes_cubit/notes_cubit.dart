import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit ():super(NotesInitail());
  List<NoteModel>?notes;
  fetchAllNotes()async{

      var notesBox = Hive.box<NoteModel>('note_box');
      notes = notesBox.values.toList();
      print("Current notes: $notes");

      emit(NotesSuccess());



  }

}