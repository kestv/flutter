import 'package:flutter_app/classes/tournament.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bowling_alley.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  int id;
  String username;
  String password;
  String name;
  String surname;
  List<Tournament> joinedTournaments = [];
  BowlingAlley bowlingAlley;
  List<Tournament> organisedTournaments = [];

  User(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.surname,
      this.joinedTournaments,
      this.organisedTournaments});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  get isOrganiser {
    return this.bowlingAlley != null ? true : false;
  }
}
