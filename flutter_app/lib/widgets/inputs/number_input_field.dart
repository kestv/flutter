import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  NumberInputField({this.labelText, this.hintText, this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          style: TextStyle(fontSize: 14),
          controller: this.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: this.labelText, hintText: this.hintText),
        ));
  }
}
