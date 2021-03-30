import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/services/tournaments_service.dart';
import 'package:flutter_app/static/user_info.dart';
import 'package:flutter_app/views/home_page.dart';

class TournamentJoinButton extends StatefulWidget {
  final Tournament tournament;

  TournamentJoinButton({this.tournament});

  @override
  _TournamentJoinButtonState createState() => _TournamentJoinButtonState();
}

class _TournamentJoinButtonState extends State<TournamentJoinButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: widget.tournament.hasUser(UserInfo.user.id)
            ? Text('Leave')
            : Text('Join'),
        onPressed: () async {
          bool isSuccess = await _joinTournament(widget.tournament);
          showDialog(
              context: context,
              builder: (BuildContext context) => _showRegisterInfo(
                  context,
                  isSuccess,
                  widget.tournament,
                  (widget.tournament.hasUser(UserInfo.user.id))));
        });
  }

  Future<bool> _joinTournament(Tournament tournament) async {
    if (tournament.hasUser(UserInfo.user.id)) {
      return await TournamentsService()
          .leaveTournament(tournament.id, UserInfo.user.id);
    }
    return await TournamentsService().joinTournament(tournament, UserInfo.user);
  }

  Widget _showRegisterInfo(BuildContext context, bool isSuccess,
      Tournament tournament, bool isCancelled) {
    return new AlertDialog(
        title: Text(isSuccess ? 'Success' : 'Failed'),
        content: SingleChildScrollView(
            child: ListBody(children: <Widget>[
          Text(isSuccess
              ? isCancelled
                  ? 'You left ${tournament.name}'
                  : '${tournament.name} has been entered'
              : 'Something went wrong'),
        ])),
        actions: <Widget>[
          TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          HomePage(),
                      transitionDuration: Duration(seconds: 0)),
                  (Route<dynamic> route) => false))
        ]);
  }
}
