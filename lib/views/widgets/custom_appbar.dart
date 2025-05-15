import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_search_icon.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({super.key, required this.text, required this.icons, this.onPressed});
final String text;
final IconData icons;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(

      children: [
        Text(text,style: TextStyle(fontSize: 28),),
        Spacer(),
        customSearchIcon(icon:icons,onPressed: onPressed,)

        
      ],
    );
  }
}
