import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';

class colorItem extends StatelessWidget {
  colorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 34,
            child: CircleAvatar(
              radius: 31,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 31,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
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
                BlocProvider.of<AddNoteCubit>(context).color=color[index];
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
