import 'package:json_annotation/json_annotation.dart';

import 'random_type.dart';

part 'random.g.dart';

@JsonSerializable()
class Random {
  final String text;
  final RandomType type;

  Random({required this.text, required this.type});

  factory Random.fromJson(Map<String, dynamic> json) => _$RandomFromJson(json);

  Map<String, dynamic> toJson() => _$RandomToJson(this);
}
