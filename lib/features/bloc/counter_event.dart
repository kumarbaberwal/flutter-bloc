part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncreamentevent extends CounterEvent {}

class CounterDecreamentevent extends CounterEvent {}

class CounterShowSnacbarEvent extends CounterEvent {}
