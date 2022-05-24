import 'package:equatable/equatable.dart';
import 'package:random/src/data/random.dart';

enum RandomStatus { initial, success, error, loading }

class RandomState extends Equatable {
  const RandomState(
      {this.state = RandomStatus.initial, this.randoms = const []});

  final RandomStatus state;
  final List<Random> randoms;

  RandomState copyWith(
      {RandomStatus Function()? state, List<Random> Function()? randoms}) {
    return RandomState(
      state: state != null ? state() : this.state,
      randoms: randoms != null ? randoms() : this.randoms,
    );
  }

  @override
  List<Object> get props => [state, randoms];
}
