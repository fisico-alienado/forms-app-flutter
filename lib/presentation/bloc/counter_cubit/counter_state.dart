part of 'counter_cubit.dart';

// sealed class CounterState {} 
// A sealed class cannot be extended outside of its library (file). This restriction allows the compiler to benefit from it.
// https://medium.com/@aliammariraq/sealed-classes-in-dart-unlocking-powerful-features-d8dba185925f

// final class CounterInitial extends CounterState {}

// * Clase que define el estado (el cómo queremos que luzca la información)
class CounterState extends Equatable {

// ! 'equatable' es un paquete muy utilizado para COMPARAR OBJETOS (no solo en BLoC) --> Ejemplo: CounterState(5,2) == CounterState(5,2) --> TRUE
// ! Resuelve un problema muy común al trabajar con objetos, que es el poder compararlos para comprobar si tienen la misma información/son iguales
// ! con BLoC se utiliza mucho para comprobar si el estado de un objeto cambió de valores.

  final int counter;
  final int transactionCount; // numero de veces que el contador ha cambiado de estado

  // Una forma de hacerlo
  // CounterState({
  //   required this.counter, 
  //   required this.transactionCount
  // }); 

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
  }); 

  // ! Es una forma de hacer una copia de clases (del CounterState actual en este caso)
  //! De esta manera podemos mantener la clase (CounterState) INMUTABLE y, cuando se quiera cambiar algo, se hace una copia de ella
  CounterState copyWith({
    int? counter, // ? == opcinales
    int? transactionCount
  }) => CounterState( //* devuelve una nueva instancia/ un nuevo objeto de CounterState con estas nuevas propiedades
    counter: counter ?? this.counter, // si no me mandan valor, usa el que aparece en CounterState por defecto
    transactionCount: transactionCount ?? this.transactionCount // idem
  );
  
  @override
  List<Object?> get props => [counter, transactionCount]; // ! listado de propiedades del objeto que quiero comparar gracias a Equatable para determinar si un objeto es igual a otro
}

//? Sin 'equatable'
// class CounterState {

//   final int counter;
//   final int transactionCount; // numero de veces que el contador ha cambiado de estado

//   // Una forma de hacerlo
//   // CounterState({
//   //   required this.counter, 
//   //   required this.transactionCount
//   // }); 

//   CounterState({
//     this.counter = 0, 
//     this.transactionCount = 0
//   }); 

//   // ! Es una forma de hacer una copia de clases (del CounterState actual en este caso)
//   //! De esta manera podemos mantener la clase (CounterState) INMUTABLE y, cuando se quiera cambiar algo, se hace una copia de ella
//   CounterState copyWith({
//     int? counter, // ? == opcinales
//     int? transactionCount
//   }) => CounterState( //* devuelve una nueva instancia/ un nuevo objeto de CounterState con estas nuevas propiedades
//     counter: counter ?? this.counter, // si no me mandan valor, usa el que aparece en CounterState por defecto
//     transactionCount: transactionCount ?? this.transactionCount // idem
//   );
// }