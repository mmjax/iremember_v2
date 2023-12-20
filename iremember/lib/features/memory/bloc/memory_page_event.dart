import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DetailMemoryEvent extends Equatable {
  const DetailMemoryEvent();
}

class LoadMemoryEvent extends DetailMemoryEvent {
  @override
  List<Object> get props => [];
}