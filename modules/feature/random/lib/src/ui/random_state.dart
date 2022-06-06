part of 'random_bloc.dart';

enum RandomStatus { initial, success, filterUpdated, error, loading }

class RandomState extends Equatable {
  const RandomState(
      {this.state = RandomStatus.initial,
      this.randoms = const [],
      this.randomSelectableTypes = const []});

  final RandomStatus state;
  final List<Random> randoms;
  final List<RandomSelectableType> randomSelectableTypes;

  RandomState copyWith(
      {RandomStatus Function()? state,
      List<Random> Function()? randoms,
      List<RandomSelectableType> Function()? randomSelectableTypes}) {
    return RandomState(
      state: state != null ? state() : this.state,
      randoms: randoms != null ? randoms() : this.randoms,
      randomSelectableTypes: randomSelectableTypes != null
          ? randomSelectableTypes()
          : this.randomSelectableTypes,
    );
  }

  @override
  List<Object> get props => [state, randoms, randomSelectableTypes];
}
