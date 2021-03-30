import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'tournament_row.dart';

class TournamentsWidget extends StatelessWidget {
  final Future<List<Tournament>> tournaments;
  TournamentsWidget({this.tournaments});

  Widget _buildTournaments() {
    return FutureBuilder<List<Tournament>>(
      future: tournaments,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              return _buildRow(context, snapshot.data[i]);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildRow(BuildContext context, Tournament tournament) {
    return CustomTournamentRow(tournament: tournament);
  }

  @override
  Widget build(BuildContext context) {
    return _buildTournaments();
  }
}
