part of 'ui/random_bloc.dart';

abstract class RandomState extends Equatable {
  const RandomState();
}

class RandomInitial extends RandomState {
  @override
  List<Object> get props => [];
}
