import 'package:random/src/data/random.dart';

class RandomRepository {
  List<Random> getRandoms() {
    return [
      Random(text: "Silicon", type: RandomType.words),
      Random(text: "San Francisco", type: RandomType.places),
      Random(text: "Abe Shinzo", type: RandomType.people),
    ];
  }
}
