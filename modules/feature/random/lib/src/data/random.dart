class Random {
  final String text;
  final RandomType type;

  Random({required this.text, required this.type});
}

enum RandomType { words, places, people }

class RandomSelectableType {
  final RandomType type;
  bool isSelected;

  RandomSelectableType({required this.type, required this.isSelected});
}
