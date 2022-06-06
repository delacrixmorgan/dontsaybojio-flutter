// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Random _$RandomFromJson(Map<String, dynamic> json) => Random(
      text: json['text'] as String,
      type: $enumDecode(_$RandomTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$RandomToJson(Random instance) => <String, dynamic>{
      'text': instance.text,
      'type': _$RandomTypeEnumMap[instance.type],
    };

const _$RandomTypeEnumMap = {
  RandomType.words: 'words',
  RandomType.places: 'places',
  RandomType.people: 'people',
};
