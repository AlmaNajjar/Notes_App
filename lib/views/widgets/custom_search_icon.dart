import 'package:flutter/material.dart';

class customSearchIcon extends StatelessWidget {
  const customSearchIcon({super.key, required this.icon, this.onPressed});
final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
width: 40,
decoration: BoxDecoration(
  color: Colors.white.withOpacity(.07),
  borderRadius: BorderRadius.circular(8),
  

),
      child: IconButton(onPressed: onPressed, icon:Icon(icon))



    );
  }
}
