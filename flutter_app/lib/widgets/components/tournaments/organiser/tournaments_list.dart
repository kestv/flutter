import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/services/tournaments_service.dart';
import 'package:flutter_app/static/user_info.dart';
import 'package:flutter_app/widgets/components/tournaments/organiser/tournament_form.dart';
import 'package:flutter_app/widgets/components/tournaments/organiser/tournament_row.dart';

class MyTournamentsList extends StatefulWidget {
  @override
  _MyTournamentsListState createState() => _MyTournamentsListState();
}

class _MyTournamentsListState extends State<MyTournamentsList> {
  Future<List<Tournament>> myTournaments;

  double buttonSize(context) => MediaQuery.of(context).size.height / 15;

  @override
  void initState() {
    super.initState();
    loadTournaments();
  }

  loadTournaments() async {
    setState(() {
      myTournaments =
          TournamentsService().getOrganisedTournaments(UserInfo.user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tournament>>(
      future: myTournaments,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              Container(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length + 1,
                    itemBuilder: (context, i) {
                      if (i == snapshot.data.length) {
                        return SizedBox(
                          height: buttonSize(context),
                        );
                      }
                      return _buildRow(context, snapshot.data[i]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        indent: 20,
                        endIndent: 20,
                      );
                    }),
              ),
              Center(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: buttonSize(context),
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue[300])),
                                onPressed: () => Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              TournamentForm(),
                                      transitionDuration: Duration(seconds: 5)),
                                ),
                                child: Text(
                                  'Create',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      )))
            ],
          );
        } else if (snapshot.hasError) {
          return SnackBar(content: Text("${snapshot.error}"));
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget _buildRow(BuildContext context, Tournament tournament) {
    return OrganisedTournamentRow(tournament: tournament);
  }
}
