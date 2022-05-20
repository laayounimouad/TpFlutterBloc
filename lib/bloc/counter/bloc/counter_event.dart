part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}
