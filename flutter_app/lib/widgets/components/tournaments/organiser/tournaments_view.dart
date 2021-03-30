import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/base/main_view.dart';

import 'tournaments_list.dart';

class MyTournamentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainView(widget: MyTournamentsList());
  }
}
