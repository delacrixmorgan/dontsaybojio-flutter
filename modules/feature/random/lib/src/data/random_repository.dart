import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'package:random/src/data/random.dart';
import 'package:random/src/data/random_selectable_type.dart';
import 'package:random/src/data/random_type.dart';

class RandomRepository {
  Future<List<Random>> getRandoms() async {
    final dataString = await rootBundle.loadString('assets/random.json');
    final Map<String, dynamic> json = await jsonDecode(dataString);

    final items = <Random>[];
    json['items'].forEach((value) {
      items.add(Random.fromJson(value));
      log(value.toString());
    });

    return items;
  }

  List<RandomSelectableType> getRandomSelectableTypes() {
    return [
      RandomSelectableType(type: RandomType.words, isSelected: true),
      RandomSelectableType(type: RandomType.people, isSelected: true),
      RandomSelectableType(type: RandomType.places, isSelected: true),
    ];
  }
}
