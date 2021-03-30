import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  TextInputField({this.labelText, this.hintText, this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          style: TextStyle(fontSize: 14),
          controller: this.controller,
          decoration: InputDecoration(
              labelText: this.labelText, hintText: this.hintText),
        ));
  }
}
