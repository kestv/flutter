// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) {
  return Tournament(
    id: json['id'] as int,
    name: json['name'] as String,
    maxPlayers: json['maxPlayers'] as int,
    playersCount: json['playersCount'] as int,
    start:
        json['start'] == null ? null : DateTime.parse(json['start'] as String),
    isStarted: json['isStarted'] as bool,
    isEnded: json['isEnded'] as bool,
    bowlingAlley: json['bowlingAlley'] == null
        ? null
        : BowlingAlley.fromJson(json['bowlingAlley'] as Map<String, dynamic>),
    users: (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    organiser: json['organiser'] == null
        ? null
        : User.fromJson(json['organiser'] as Map<String, dynamic>),
    prize: json['prize'] as String,
  );
}

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'prize': instance.prize,
      'maxPlayers': instance.maxPlayers,
      'playersCount': instance.playersCount,
      'start': instance.start?.toIso8601String(),
      'isStarted': instance.isStarted,
      'isEnded': instance.isEnded,
      'bowlingAlley': instance.bowlingAlley?.toJson(),
      'users': instance.users?.map((e) => e?.toJson())?.toList(),
      'organiser': instance.organiser?.toJson(),
    };
