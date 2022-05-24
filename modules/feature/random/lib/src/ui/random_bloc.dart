import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random/src/data/random_repository.dart';
import 'package:random/src/ui/random_event.dart';
import 'package:random/src/ui/random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  final RandomRepository _randomRepository;

  RandomBloc({required RandomRepository randomRepository})
      : _randomRepository = randomRepository,
        super(const RandomState()) {
    on<Start>(_onStart);
  }

  Future<void> _onStart(Start event, Emitter<RandomState> emit) async {
    emit(state.copyWith(state: () => RandomStatus.loading));

    final items = _randomRepository.getRandoms();
    state.copyWith(state: () => RandomStatus.success, randoms: () => items);

    // await emit.forEach<List<Random>>(_randomRepository.getRandoms(),
    //     onData: (items) =>
    //         state.copyWith(state: () => RandomStatus.success, randoms: () => items),
    //     onError: (_, __) => state.copyWith(state: () => RandomStatus.error));
  }
}
