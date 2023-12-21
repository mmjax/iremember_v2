import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'data/memory/repository.dart';
import 'features/memory/bloc/memory_page_bloc.dart';
import 'features/memory_list/bloc/memory_list_bloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MemoryRepository());
  locator.registerLazySingleton(() => const FlutterSecureStorage());
  locator.registerLazySingleton(() => DetailMemoryBloc(locator<MemoryRepository>(), locator<FlutterSecureStorage>()));
  locator.registerLazySingleton(() => MemoryListBloc(locator<MemoryRepository>(), locator<FlutterSecureStorage>()));
}