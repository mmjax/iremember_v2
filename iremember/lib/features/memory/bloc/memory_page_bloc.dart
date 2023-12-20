import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iremember/data/memory/repository.dart';
import 'package:iremember/features/memory/bloc/memory_page_event.dart';
import 'package:iremember/features/memory/bloc/memory_page_state.dart';


class DetailMemoryBloc extends Bloc<DetailMemoryEvent, DetailMemoryState> {
  final MemoryRepository _memoryRepository;
  final FlutterSecureStorage _storage;
  int _memoryId = 0;

  void setMemoryId(int memoryId) {
    _memoryId = memoryId;
  }

  DetailMemoryBloc(this._memoryRepository, this._storage) : super(MemoryLoadingState()) {
    on<LoadMemoryEvent>((event, emit) async {
      emit(MemoryLoadingState());
      try {
        final token = await _storage.read(key: 'token');
        final memory = await _memoryRepository.getMemoryById(_memoryId, token!);
        emit(MemoryLoadedState(memory));
      } catch (e) {
        emit(MemoryErrorState(e.toString()));
      }
    });
  }
}
