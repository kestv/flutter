import 'package:json_annotation/json_annotation.dart';

part 'bowling_alley.g.dart';

@JsonSerializable(explicitToJson: true)
class BowlingAlley {
  int id;
  String name;
  String address;
  String imageUrl;
  String phoneNo;

  BowlingAlley({this.id, this.name, this.address, this.imageUrl, this.phoneNo});

  factory BowlingAlley.fromJson(Map<String, dynamic> json) =>
      _$BowlingAlleyFromJson(json);

  Map<String, dynamic> toJson() => _$BowlingAlleyToJson(this);
}
