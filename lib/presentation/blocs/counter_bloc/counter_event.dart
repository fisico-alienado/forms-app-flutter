part of 'counter_bloc.dart';

// ! Para emitir nuevos estados, se hace basado en eventos.

abstract class CounterEvent{
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {
  final int value = 0;
}

//* Se podría llegar a usar Equatable para comparar eventos/metodos, pero es mas raro y suele ser innecesario
// sealed class CounterEvent extends Equatable {
//   const CounterEvent();

//   @override
//   List<Object> get props => [];
// }
