import 'package:flutter/material.dart';
import 'package:flutter_app/classes/tournament.dart';
import 'package:flutter_app/services/tournaments_service.dart';
import 'package:flutter_app/static/user_info.dart';
import 'package:flutter_app/widgets/components/tournaments/organiser/tournaments_view.dart';
import 'package:flutter_app/widgets/inputs/date_input_field.dart';
import 'package:flutter_app/widgets/inputs/number_input_field.dart';

import '../../../inputs/text_input_field.dart';

class TournamentForm extends StatefulWidget {
  final nameController = new TextEditingController();
  final playerCountController = new TextEditingController();
  final prizeController = new TextEditingController();
  final dateController = new TextEditingController();
  @override
  _TournamentFormState createState() => _TournamentFormState();
}

class _TournamentFormState extends State<TournamentForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void submitForm() async {
      var tournament = new Tournament(
        name: widget.nameController.text,
        maxPlayers: int.parse(widget.playerCountController.text),
        prize: widget.prizeController.text,
        start: DateTime.parse(widget.dateController.text),
        bowlingAlley: UserInfo.user.bowlingAlley,
        isEnded: false,
        isStarted: false,
        organiser: UserInfo.user,
      );
      bool isSuccess =
          await TournamentsService().addTournament(tournament.serialize());
      if (isSuccess) {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                MyTournamentsView(),
            transitionDuration: Duration(seconds: 0)));
      }
    }

    return Scaffold(
        backgroundColor: Colors.blue[200],
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                elevation: 10,
                child: Column(children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: 80,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  'Create tournament',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )))),
                        Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: TextInputField(
                              labelText: 'Name',
                              hintText: 'Enter name of a tournament',
                              controller: widget.nameController,
                            )),
                        DateInputField(
                            labelText: 'Due date',
                            hintText: 'Select due date',
                            controller: widget.dateController),
                        NumberInputField(
                          labelText: 'Players count',
                          hintText: 'Enter players capacity',
                          controller: widget.playerCountController,
                        ),
                        TextInputField(
                          labelText: 'Prize',
                          hintText: 'Enter prize of a tournament',
                          controller: widget.prizeController,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.82,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                ),
                                onPressed: submitForm,
                                child: Text('Submit')))
                      ],
                    ),
                  )
                ]))));
  }
}
