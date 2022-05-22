class Random {
  final String text;
  final RandomType type;

  Random({required this.text, required this.type});
}

enum RandomType { words, places, people }
