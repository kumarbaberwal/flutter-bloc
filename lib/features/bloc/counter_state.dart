part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

abstract class CounterActionState extends CounterState {}

final class CounterInitial extends CounterState {}

class CounterIncreamentState extends CounterState {
  final int val;

  CounterIncreamentState({required this.val});
}

class CounterDecreamentState extends CounterState {
  final int val;

  CounterDecreamentState({required this.val});
}

class CounterShowSnackbarActionState extends CounterActionState {}
