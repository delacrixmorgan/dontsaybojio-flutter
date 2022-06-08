import 'dart:developer';
import 'dart:js';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random/src/data/random.dart';
import 'package:random/src/data/random_repository.dart';
import 'package:random/src/data/random_selectable_type.dart';

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
    on<RandomButtonClicked>(_onRandomButtonClicked);
  }

  Future<void> _onStart(Start event, Emitter<RandomState> emit) async {
    emit(state.copyWith(state: () => RandomStatus.loading));

    final items = await _randomRepository.getRandoms();
    final selectableTypes = _randomRepository.getRandomSelectableTypes();

    items.shuffle();
    emit(state.copyWith(
        state: () => RandomStatus.success,
        randoms: () => items,
        randomSelectableTypes: () => selectableTypes));
  }

  Future<void> _onFilterUpdated(
      FiltersUpdated event, Emitter<RandomState> emit) async {
    emit(state.copyWith(
        randomSelectableTypes: () => event.randomSelectableTypes));
  }

  Future<void> _onRandomButtonClicked(
      RandomButtonClicked event, Emitter<RandomState> emit) async {
    var newPosition = state.currentPosition + 1;
    if (newPosition >= state.filteredRandoms.length) {
      newPosition = 0;
    }
    emit(state.copyWith(currentPosition: () => newPosition));
  }
}
