import 'package:equatable/equatable.dart';

import '../data/random.dart';

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

  const Loaded(this.randoms);

  @override
  List<Object?> get props => [randoms];
}
