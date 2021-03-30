import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/components/profile/profile_hanging.dart';

class TopContainer extends StatelessWidget {
  final EdgeInsets padding;
  TopContainer({this.padding});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 10,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        ),
        color: Colors.transparent,
        child: Container(
            padding: padding != null
                ? padding
                : EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                )),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[ProfileHanging()]),
            )));
  }
}
