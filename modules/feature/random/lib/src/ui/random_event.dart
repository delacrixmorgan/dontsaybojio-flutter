part of 'random_bloc.dart';

abstract class RandomEvent extends Equatable {
  const RandomEvent();

  @override
  List<Object?> get props => [];
}

class Start extends RandomEvent {
  const Start();
}

class Loaded extends RandomEvent {
  final List<Random> randoms;
  final List<RandomSelectableType> randomSelectableTypes;

  const Loaded(this.randoms, this.randomSelectableTypes);

  @override
  List<Object?> get props => [randoms, randomSelectableTypes];
}

class FiltersUpdated extends RandomEvent {
  final List<RandomSelectableType> randomSelectableTypes;

  const FiltersUpdated(this.randomSelectableTypes);

  @override
  List<Object?> get props => [randomSelectableTypes];
}
