import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/widgets/components/tournaments/base/tournament_details.dart';
import 'package:flutter_app/widgets/components/tournaments/base/tournament_join_button.dart';

import '../../../base/main_view.dart';

class CustomTournamentRow extends StatefulWidget {
  final Tournament tournament;

  final _biggerFont = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);

  CustomTournamentRow({this.tournament});

  @override
  _CustomTournamentRowState createState() => _CustomTournamentRowState();
}

class _CustomTournamentRowState extends State<CustomTournamentRow> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
            onTap: () => _openTournament(context, widget.tournament),
            title: Align(
              child: Text(
                widget.tournament.name,
                style: widget._biggerFont,
              ),
              alignment: Alignment(-1.2, 0),
            ),
            leading: Icon(
              Icons.emoji_events,
              color: Colors.orangeAccent,
            ),
            trailing: TournamentJoinButton(tournament: widget.tournament)));
  }

  void _openTournament(BuildContext context, Tournament tournament) {
    var tournamentView = (TournamentDetails(
      tournament: tournament,
    ));

    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              MainView(widget: tournamentView),
          transitionDuration: Duration(seconds: 0)),
    );
  }
}
