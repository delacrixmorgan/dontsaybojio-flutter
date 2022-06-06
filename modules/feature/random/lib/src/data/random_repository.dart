import 'package:random/src/data/random.dart';

class RandomRepository {
  List<Random> getRandoms() {
    return [
      Random(text: "Silicon", type: RandomType.words),
      Random(text: "San Francisco", type: RandomType.places),
      Random(text: "Abe Shinzo", type: RandomType.people),
    ];
  }

  List<RandomSelectableType> getRandomSelectableTypes() {
    return [
      RandomSelectableType(type: RandomType.words, isSelected: true),
      RandomSelectableType(type: RandomType.people, isSelected: true),
      RandomSelectableType(type: RandomType.places, isSelected: true),
    ];
  }
}
