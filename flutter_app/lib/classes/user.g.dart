// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    username: json['username'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    joinedTournaments: (json['joinedTournaments'] as List)
        ?.map((e) =>
            e == null ? null : Tournament.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    organisedTournaments: (json['organisedTournaments'] as List)
        ?.map((e) =>
            e == null ? null : Tournament.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..bowlingAlley = json['bowlingAlley'] == null
      ? null
      : BowlingAlley.fromJson(json['bowlingAlley'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
      'joinedTournaments':
          instance.joinedTournaments?.map((e) => e?.toJson())?.toList(),
      'bowlingAlley': instance.bowlingAlley?.toJson(),
      'organisedTournaments':
          instance.organisedTournaments?.map((e) => e?.toJson())?.toList(),
    };
