import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  DateInputField({this.labelText, this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          style: TextStyle(fontSize: 14),
          controller: controller,
          onTap: () => showDatePicker(
            context: context,
            initialDate: new DateTime.now(),
            firstDate: new DateTime.now(),
            lastDate: DateTime(2030),
          ).then((DateTime dateTime) => {
                dateTime = dateTime,
                showTimePicker(
                        context: context, initialTime: new TimeOfDay.now())
                    .then((TimeOfDay time) => {
                          dateTime = new DateTime(dateTime.year, dateTime.month,
                              dateTime.day, time.hour, time.minute),
                          controller.text = dateTime.toString(),
                        })
              }),
          readOnly: true,
          decoration: InputDecoration(labelText: labelText, hintText: hintText),
        ));
  }
}
