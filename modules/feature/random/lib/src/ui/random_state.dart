part of 'random_bloc.dart';

enum RandomStatus { initial, success, error, loading }

class RandomState {
  const RandomState(
      {this.state = RandomStatus.initial,
      this.randoms = const [],
      this.randomSelectableTypes = const [],
      this.currentPosition = 0});

  final RandomStatus state;
  final List<Random> randoms;
  final List<RandomSelectableType> randomSelectableTypes;
  final int currentPosition;

  RandomState copyWith(
      {RandomStatus Function()? state,
      List<Random> Function()? randoms,
      List<RandomSelectableType> Function()? randomSelectableTypes,
      int Function()? currentPosition}) {
    return RandomState(
      state: state != null ? state() : this.state,
      randoms: randoms != null ? randoms() : this.randoms,
      randomSelectableTypes: randomSelectableTypes != null
          ? randomSelectableTypes()
          : this.randomSelectableTypes,
      currentPosition:
          currentPosition != null ? currentPosition() : this.currentPosition,
    );
  }
}
