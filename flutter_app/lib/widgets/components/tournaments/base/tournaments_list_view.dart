import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/services/tournaments_service.dart';
import 'package:flutter_app/static/user_info.dart';
import 'package:flutter_app/widgets/components/tournaments/base/tournaments_list.dart';

class TournamentsListView extends StatefulWidget {
  @override
  _TournamentsListViewState createState() => _TournamentsListViewState();
}

class _TournamentsListViewState extends State<TournamentsListView> {
  Future<List<Tournament>> allTournaments;
  Future<List<Tournament>> userTournaments;

  @override
  void initState() {
    super.initState();
    loadTournaments();
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
    return TabBarView(
      children: [
        TournamentsWidget(
          tournaments: allTournaments,
        ),
        TournamentsWidget(
          tournaments: userTournaments,
        )
      ],
    );
  }
}
