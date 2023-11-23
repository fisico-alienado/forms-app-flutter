import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart'; //! Indica que este archivo y 'counter_state.dart' son un mismo archivo DIVIDIDO EN VARIAS PARTES

// ! Es como el caso del StateNotifier de Riverpod en la aplicación de los widgets. Cubit<> maneja la clase/estado que pongamos entre <>

// !      Riverpod                           -->      Cubit
// !      class A extends StateNotifier<B>            class A extends Cubit<B>

// ! Donde la clase 'A' va a controlar el estado de la clase 'B'. Además en ambos casos, la clase B tiene que inicializarse con 'A(): super(B())'.
// * CounterCubit() maneja el CounterState() a través de Cubit<>

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState( counter: 5)); //* Estamos obligados a crear un constructor que invoque/inicialice la clase padre de la que heredamos
  // State = Estado = new CounterState(); --> Estamos creando una instancia de AppTheme

  void increaseBy( int value ) {
    // Una forma
    // emit( CounterState(
    //   counter: state.counter + value,
    //   transactionCount: state.transactionCount + 1
    // ));
    
    //* Mejor que lo anterior porque lo hemos definido de tal manera que no estamos obligados a enviar todos los parametros, 
    //* mientras que con la otra opcion estamos creando CounterState() completo cada vez y obligados a definir cada parametro.
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1
    ));
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
      // transactionCount: state.transactionCount + 1 // no contamos como cambio de estado el reset
    ));
  }

}
