import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  const customTextField(
      {required this.hint, required this.maxLine, this.onSaved, this.onChanged});

  final String? hint;
  final int? maxLine;
  final void Function(String?)? onSaved;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLine,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      cursorColor: Color(0xff62FCD7),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xff62FCD7)),
          border: buildBorder(),
          focusedBorder: buildBorder(Color(0xff62FCD7)),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
