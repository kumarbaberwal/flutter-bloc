import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncreamentevent>(counterIncreamentevent);
    on<CounterDecreamentevent>(counterDecreamentevent);
    on<CounterShowSnacbarEvent>(counterShowSnacbarEvent);
  }

  int value = 0;

  FutureOr<void> counterIncreamentevent(
      CounterIncreamentevent event, Emitter<CounterState> emit) {
    value = value + 1;
    emit(CounterIncreamentState(val: value));
  }

  FutureOr<void> counterDecreamentevent(
      CounterDecreamentevent event, Emitter<CounterState> emit) {
    value = value - 1;
    emit(CounterDecreamentState(val: value));
  }

  FutureOr<void> counterShowSnacbarEvent(
      CounterShowSnacbarEvent event, Emitter<CounterState> emit) {
    emit(CounterShowSnackbarActionState());
  }
}
