import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    //* Manejador / Handler de un CounterEvent
    on<CounterIncreased>((event, emit) => _onCounterIncreased(event, emit));
    // Como los argumentos son los mismos que se envian, se sobreentiende y tambien seria valido mandarlos por referencia de la siguiente manera
    // on<CounterIncreased>(_onCounterIncreased);
  }
  
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value, //* event == CounterIncreased(), el cual tiene la property 'value'
      transactionCount: state.transactionCount + 1
    ));
  }
}
