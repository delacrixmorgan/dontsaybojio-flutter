import 'package:equatable/equatable.dart';

import '../data/random.dart';

enum RandomStatus { initial, success, error, loading }

class RandomState extends Equatable {
  final RandomStatus status;
  final List<Random> randoms;

  const RandomState(
      {this.status = RandomStatus.initial, this.randoms = const []});

  @override
  List<Object> get props => [status, randoms];
}
