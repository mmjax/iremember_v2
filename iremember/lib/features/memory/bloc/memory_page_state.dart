import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:iremember/data/memory/models.dart' as memory_data;

@immutable
abstract class DetailMemoryState extends Equatable {}

class MemoryLoadingState extends DetailMemoryState {
  @override
  List<Object?> get props => [];
}

class MemoryLoadedState extends DetailMemoryState {
  final memory_data.Memory memory;

 MemoryLoadedState(this.memory);

  @override
  List<Object?> get props => [memory];
}

class MemoryErrorState extends DetailMemoryState {
  final String error;

  MemoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
