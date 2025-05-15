import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/cubits/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/nots_view.dart';

import 'cubits/notes_cubit/notes_cubit.dart';

void main()async {
  await Hive.initFlutter();
  Bloc.observer=SimpleBlocObserver();
   Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('note_box');
  runApp(const noteApp());
}

class noteApp extends StatelessWidget {
  const noteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NotesCubit(),
      child: MaterialApp(
        title: 'noteapp',
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: notsView(),
      ),
    );
  }
}