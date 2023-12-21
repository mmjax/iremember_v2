import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:iremember/data/memory/models.dart';

@immutable
abstract class ListMemoryState extends Equatable {}

class MemoryLoadingState extends ListMemoryState {
  @override
  List<Object?> get props => [];
}

class MemoryLoadedState extends ListMemoryState {
  final List<Memory> memories;

  MemoryLoadedState(this.memories);

  @override
  List<Object?> get props => [memories];
}

class MemoryErrorState extends ListMemoryState {
  final String error;

  MemoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
