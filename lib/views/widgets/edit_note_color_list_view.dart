
import 'package:flutter/material.dart';

import '../../models/note_model.dart';
import 'color_list_view.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int currentIndex ;
  List<Color> color = [
    Color(0xff7A5C61),
    Color(0xffF7ACCF),
    Color(0xffE8F0FF),
    Color(0xff6874E8),
    Color(0xff392759),
    Color(0xffDB5461),
    Color(0xffFFD9CE),
    Color(0xff8ef9f3),

  ];
  @override
  void initState() {
    currentIndex=color.indexOf(Color(widget.note.color));
    // TODO: implement initState
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 34 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              child: colorItem(
                isActive: currentIndex == index,
                color: color[index],
              ),
              onTap: () {
                currentIndex = index;
                widget.note.color=color[index].value;
                setState(() {});
              },
            ),
          );
        },
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
