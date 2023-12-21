import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iremember/data/memory/models.dart';
import 'package:iremember/features/memory_list/bloc/memory_list_event.dart';
import 'package:iremember/features/memory_list/bloc/memory_list_state.dart';
import '../../../data/memory/repository.dart';

class MemoryListBloc extends Bloc<MemoryListEvent, ListMemoryState> {
  final MemoryRepository _memoryRepository;
  final FlutterSecureStorage _storage;

  MemoryListBloc(this._memoryRepository, this._storage) : super(MemoryLoadingState()) {
    on<LoadMemoriesEvent>((event, emit) async {
      emit(MemoryLoadingState());
      try {
        final token = await _storage.read(key: 'token');
        final memories = await _memoryRepository.getMemories(token!);
        emit(MemoryLoadedState(memories));
      } catch (e) {
        emit(MemoryErrorState(e.toString()));
      }
    });
  }
}
