import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Widget widget;
  final String name;
  final IconData icon;
  DrawerTile({this.widget, this.name, this.icon});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => widget,
              transitionDuration: Duration(seconds: 0)),
        );
      },
    );
  }
}
