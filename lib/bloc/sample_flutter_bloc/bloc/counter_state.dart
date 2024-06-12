part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterSuccess extends CounterState {
  final int value;

  CounterSuccess(this.value);
}

final class CounterFailure extends CounterState {
  final String message;

  CounterFailure(this.message);
}

final class CounterLoading extends CounterState {}