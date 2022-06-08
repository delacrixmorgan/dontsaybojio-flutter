import "package:equatable/equatable.dart";
import 'package:random/src/data/random.dart';
import 'package:random/src/data/random_type.dart';

class RandomSelectableType extends Equatable {
  final RandomType type;
  bool isSelected;

  RandomSelectableType({required this.type, required this.isSelected});

  @override
  List<Object?> get props => [isSelected];

  @override
  bool operator ==(Object other) =>
      other is RandomSelectableType &&
      type == other.type &&
      isSelected == other.isSelected;

  @override
  int get hashCode => type.hashCode ^ isSelected.hashCode;
}

extension FilterRandomsExtension on List<RandomSelectableType> {
  Iterable<Random> filterBy(List<Random> randoms) {
    final Iterable<RandomType> selectedTypes =
        where((element) => element.isSelected).map((e) => e.type);
    return randoms.where((element) => selectedTypes.contains(element.type));
  }
}
