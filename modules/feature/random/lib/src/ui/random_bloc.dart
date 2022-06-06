import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random/src/data/random.dart';
import 'package:random/src/data/random_repository.dart';

part 'random_event.dart';

part 'random_page.dart';

part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  final RandomRepository _randomRepository;

  RandomBloc({required RandomRepository randomRepository})
      : _randomRepository = randomRepository,
        super(const RandomState()) {
    on<Start>(_onStart);
    on<FiltersUpdated>(_onFilterUpdated);
  }

  Future<void> _onStart(Start event, Emitter<RandomState> emit) async {
    emit(state.copyWith(state: () => RandomStatus.loading));

    final items = _randomRepository.getRandoms();
    items.shuffle();

    var selectableTypes = [
      RandomSelectableType(type: RandomType.words, isSelected: false),
      RandomSelectableType(type: RandomType.people, isSelected: false),
      RandomSelectableType(type: RandomType.places, isSelected: false),
    ];

    emit(state.copyWith(
        state: () => RandomStatus.success,
        randoms: () => items,
        randomSelectableTypes: () => selectableTypes));
  }

  Future<void> _onFilterUpdated(
      FiltersUpdated event, Emitter<RandomState> emit) async {
    for (final random in event.randomSelectableTypes) {
      log('onFilterUpdated Random: ${random.type} ${random.isSelected}');
    }

    emit(state.copyWith(
        randomSelectableTypes: () => event.randomSelectableTypes));
  }
}
