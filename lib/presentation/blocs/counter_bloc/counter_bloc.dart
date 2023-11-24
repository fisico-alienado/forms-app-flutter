import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>((event, emit) { //? Manejador / Handler de un CounterEvent

      emit(state.copyWith(
        counter: state.counter + event.value, //* event == CounterIncreased(), el cual tiene la property 'value'
        transactionCount: state.transactionCount + 1
      ));    
    });
  }
}
