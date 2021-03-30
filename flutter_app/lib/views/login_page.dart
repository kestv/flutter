import 'package:flutter/material.dart';
import 'package:flutter_app/services/users_service.dart';
import 'package:flutter_app/static/user_info.dart';
import 'package:flutter_app/widgets/base/main_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  loadUserInfo() async {
    setState(() {
      UsersService().getUser(5).then((value) => UserInfo.user = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainView(
      widget: Container(),
    );
  }
}
