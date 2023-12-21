import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MemoryListEvent extends Equatable {
  const MemoryListEvent();
}

class LoadMemoriesEvent extends MemoryListEvent {
  @override
  List<Object> get props => [];
}