import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/classes/user.dart';
import 'package:flutter_app/services/tournaments_service.dart';
import 'package:flutter_app/services/users_service.dart';
import 'package:flutter_app/static/user_info.dart';
import 'package:flutter_app/widgets/base/main_view.dart';
import 'package:flutter_app/widgets/components/sliver_bottom_tabs.dart';
import 'package:flutter_app/widgets/components/tournaments/base/tournaments_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Tournament>> allTournaments;
  Future<List<Tournament>> userTournaments;
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
    loadTournaments();
  }

  loadUserInfo() {
    return UsersService().getUser(5).then((value) => UserInfo.user = value);
  }

  loadTournaments() async {
    setState(() {
      allTournaments = TournamentsService().getTournaments();
      userTournaments =
          TournamentsService().getUserTournaments(UserInfo.user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: loadUserInfo(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (UserInfo.user != null) {
            return MainView(
              widget: TabBarView(children: [
                TournamentsWidget(
                  tournaments: allTournaments,
                ),
                TournamentsWidget(
                  tournaments: userTournaments,
                ),
              ]),
              bottom: SliverBottomTabs.getTabs(),
            );
          }
          return Container(
              color: Colors.white,
              child: Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator())));
        });
  }
}
