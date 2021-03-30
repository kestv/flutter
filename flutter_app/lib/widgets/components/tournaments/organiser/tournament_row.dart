import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/widgets/components/tournaments/base/tournament_details.dart';

import '../../../base/main_view.dart';

class OrganisedTournamentRow extends StatefulWidget {
  final Tournament tournament;

  final _biggerFont = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);

  OrganisedTournamentRow({this.tournament});

  @override
  _OrganisedTournamentRowState createState() => _OrganisedTournamentRowState();
}

class _OrganisedTournamentRowState extends State<OrganisedTournamentRow> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          tileColor: Colors.transparent,
          onTap: () => _editTournament(context, widget.tournament),
          title: Align(
            child: Text(
              widget.tournament.name,
              style: widget._biggerFont,
            ),
            alignment: Alignment(-1.2, 0),
          ),
          subtitle: Text(widget.tournament.start.toIso8601String()),
          leading: Icon(
            Icons.emoji_events,
            color: Colors.orangeAccent,
          ),
        ));
  }

  void _editTournament(BuildContext context, Tournament tournament) {
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
