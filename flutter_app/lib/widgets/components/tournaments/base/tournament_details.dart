import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/widgets/components/tournaments/base/tournament_join_button.dart';

class TournamentDetails extends StatelessWidget {
  final Tournament tournament;
  // final _biggerFontTitle =
  //     TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  // final _biggerFont = TextStyle(fontSize: 18.0);

  TournamentDetails({this.tournament});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Image(
                    image: NetworkImage(
                        'https://www.meadowsgaming.com/-/media/png/east/meadows/images/mobile-380x214/bowling/bowling-alley-380x214.jpg')),
              ),
              ListTile(
                leading: Icon(Icons.place),
                title: Text('${tournament.bowlingAlley.name}'),
                subtitle: Text('${tournament.bowlingAlley.address}'),
              ),
              ListTile(
                leading: Icon(
                  Icons.emoji_events,
                  color: Colors.orangeAccent,
                ),
                title: Text('${tournament.name}'),
                subtitle: Text('${tournament.start}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TournamentJoinButton(tournament: tournament)
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
