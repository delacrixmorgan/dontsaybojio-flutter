import 'package:get_it/get_it.dart';
import 'package:random/src/data/random_repository.dart';

final getIt = GetIt.I;

void setupDataLocators() async {
  provideRandomRepository();
}

Future<RandomRepository> provideRandomRepository() async {
  var repository = RandomRepository();
  getIt.registerFactory(() => repository);
  return repository;
}
