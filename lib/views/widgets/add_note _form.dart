import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'color_list_view.dart';
import 'custm_text_field.dart';
import 'custom_button.dart';

class addFormNots extends StatefulWidget {
  addFormNots({super.key});

  @override
  State<addFormNots> createState() => _addFormNotsState();
}

class _addFormNotsState extends State<addFormNots> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          customTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
            maxLine: 1,
          ),
          SizedBox(
            height: 50,
          ),
          customTextField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'content',
              maxLine: 5),
          SizedBox(
            height: 24,
          ),
          ColorsListView(),
          SizedBox(height: 20,),
          BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
            return customButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat('dd_mm_yyyy').format(currentDate);
                  var noteModel = NoteModel(
                      title: title!,
                      subtitle: subTitle!,
                      date: formattedCurrentDate,
                      color: Colors.blue.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;

                  setState(() {});
                }
              },
            );
          })
        ],
      ),
    );
  }
}
