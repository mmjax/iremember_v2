import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iremember/data/memory/repository.dart';
import 'package:iremember/features/memory/bloc/memory_page_event.dart';
import 'package:iremember/features/memory/bloc/memory_page_state.dart';


class DetailMemoryBloc extends Bloc<DetailMemoryEvent, DetailMemoryState> {
  final MemoryRepository _memoryRepository;
  int _memoryId = 0;

  void setMemoryId(int memoryId) {
    _memoryId = memoryId;
  }

  DetailMemoryBloc(this._memoryRepository) : super(MemoryLoadingState()) {
    on<LoadMemoryEvent>((event, emit) async {
      emit(MemoryLoadingState());
      try {
        final memory = await _memoryRepository.getMemoryById(_memoryId);
        emit(MemoryLoadedState(memory));
      } catch (e) {
        emit(MemoryErrorState(e.toString()));
      }
    });
  }
}
