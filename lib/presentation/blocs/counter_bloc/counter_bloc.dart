import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// ! Informacion en los archivos de Cubit y son comparables entre sí, para no repetir información.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    
    //* Manejador / Handler de un CounterEvent
    on<CounterIncreased>((event, emit) => _onCounterIncreased(event, emit));
    // Como los argumentos son los mismos que se envian, se sobreentiende y tambien seria valido mandarlos por referencia de la siguiente manera
    // on<CounterIncreased>(_onCounterIncreased);

    on<CounterReset>((event, emit) => _onCounterReset(event, emit));
  }
  
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value, //* event == CounterIncreased(), el cual tiene la property 'value'
      transactionCount: state.transactionCount + 1
    ));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: event.value,
      // transactionCount: state.transactionCount + 1 // no contamos como cambio de estado el reset
    ));
  }

}
