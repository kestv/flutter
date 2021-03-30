// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bowling_alley.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BowlingAlley _$BowlingAlleyFromJson(Map<String, dynamic> json) {
  return BowlingAlley(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    imageUrl: json['imageUrl'] as String,
    phoneNo: json['phoneNo'] as String,
  );
}

Map<String, dynamic> _$BowlingAlleyToJson(BowlingAlley instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'imageUrl': instance.imageUrl,
      'phoneNo': instance.phoneNo,
    };
