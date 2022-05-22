import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/random.dart';

part '../random_state.dart';

part 'random_event.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc() : super(RandomInitial()) {
    on<RandomEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
