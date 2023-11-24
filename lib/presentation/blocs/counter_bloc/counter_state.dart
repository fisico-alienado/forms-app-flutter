part of 'counter_bloc.dart';

// ! Informacion en los archivos de Cubit y son comparables entre sí, para no repetir información.

class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
  });
  
  CounterState copyWith({
    int? counter, // ? == opcinales
    int? transactionCount
  }) => CounterState( //* devuelve una nueva instancia/ un nuevo objeto de CounterState con estas nuevas propiedades
    counter: counter ?? this.counter, // si no me mandan valor, usa el que aparece en CounterState por defecto
    transactionCount: transactionCount ?? this.transactionCount // idem
  );

  @override
  List<Object> get props => [counter, transactionCount];
}
