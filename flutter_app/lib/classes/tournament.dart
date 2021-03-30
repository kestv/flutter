import 'package:flutter_app/classes/bowling_alley.dart';
import 'package:flutter_app/classes/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tournament.g.dart';

@JsonSerializable(explicitToJson: true)
class Tournament {
  int id;
  String name;
  String prize;
  int maxPlayers;
  int playersCount;
  DateTime start;
  bool isStarted;
  bool isEnded;
  BowlingAlley bowlingAlley;
  List<User> users = [];
  User organiser;

  Tournament(
      {this.id,
      this.name,
      this.maxPlayers,
      this.playersCount,
      this.start,
      this.isStarted,
      this.isEnded,
      this.bowlingAlley,
      this.users,
      this.organiser,
      this.prize});

  Tournament serialize() {
    Tournament serializedTournament = new Tournament(
        id: this.id ?? 0,
        name: this.name ?? '',
        maxPlayers: this.maxPlayers ?? 0,
        playersCount: this.playersCount ?? 0,
        start: this.start ?? new DateTime.now(),
        isStarted: this.isStarted != null ? this.isStarted : false,
        isEnded: this.isEnded != null ? this.isEnded : false,
        bowlingAlley: this.bowlingAlley ?? new BowlingAlley(),
        users: this.users ?? [],
        organiser: this.organiser ?? new User(),
        prize: this.prize ?? '');
    return serializedTournament;
  }

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentToJson(this);

  bool hasUser(int userId) {
    return this.users.length != 0 && this.users.any((u) => u.id == userId);
  }
}
