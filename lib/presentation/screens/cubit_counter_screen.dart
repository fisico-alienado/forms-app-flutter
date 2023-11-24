import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Es como el MultiProvider() de la Yes_no_app, tenemos que envolver con el CubitBloc todos aquellos widgets que queramos que tengan acceso al cubit en cuestión.
    return BlocProvider(
      create: ( _ ) => CounterCubit(), //! devuelve una instancia/objeto del CounterCubit() y le de acceso a esa instancia al widget child.
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  // Otra forma de tener centralizado el uso de la función CounterCubit.increaseBy()
  void increaseCountBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {

    //! Forma 2: Forma clásica como el gestor PROVIDER de comunicar cambios en vez de utilizar el BlocBuilder<>: .watch() == estate pendiente del siguiente provider. 
    //? Lo malo es que el watch() con cada cambio del estado, como estamos utilizando el copyWith(), estamos emitiendo nuevos objetos (estados) y haciendo que se redibujen los widgets ineficientemente.
    // final counterState = context.watch<CounterCubit>().state; //* Con .state le estamos diciendo que redibuje cada vez que haya un cambio

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Cubit Counter'),
          ]),
        
        actions: [
          IconButton(
            onPressed: () => {
              //! Forma 2: Forma clásica como el gestor PROVIDER
              context.read<CounterCubit>().reset()
            }, 
            icon: const Icon(Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5, // FORMA DE SABER LAS DIMENSIONES DEL DISPOSITIVO MOVIL EN USO
                child: Center(
                  child: BlocBuilder<CounterCubit, CounterState>(// ! Forma 1: Maneja los Widgets que contienen estados de Cubit o Bloc. CounterCubit() maneja el CounterState()
                    // buildWhen: (previous, current) => current.counter != previous.counter, // * forma de evitar que se redibuje el widget                    
                    builder: (context, state) {
                      // print('el counter cambió!!); //* para comprobar si al darle a reset() se redibuja el widget
                      return Text('Counter value: ${state.counter}');
                    },
                  )
                )
              ),
              const SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5, // FORMA DE SABER LAS DIMENSIONES DEL DISPOSITIVO MOVIL EN USO
                child: Column(
                  children: [
                    const Text('Número de veces que el contador ha cambiado de estado:', textAlign: TextAlign.center),
                    const SizedBox(height: 10,),
                    // ! Forma 2
                    // Text('${counterState.transactionCount}')
                    //! Forma 3: si solo quiero estar pendiente de un Cubit o un BLoC, podemos seleccionar uno entero
                    context.select((CounterCubit counterCubit) => Text('${counterCubit.state.transactionCount}'))
                  ]
                )
              )
            ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'a',
            child: const Text('+3'),
            onPressed: () => {
              context.read<CounterCubit>().increaseBy(3)
              // Forma con funcion
              // increaseCountBy(context, 3);
            },
          ),
          
          const SizedBox(height: 10,),
    
          FloatingActionButton(
            heroTag: 'b',
            child: const Text('+2'),
            onPressed: () => {
              context.read<CounterCubit>().increaseBy(2)
              // Forma con funcion
              // increaseCountBy(context, 2);
            },
          ),
    
          const SizedBox(height: 10,),
    
          FloatingActionButton(
            heroTag: 'c',
            child: const Text('+1'),
            onPressed: () => {
              context.read<CounterCubit>().increaseBy(1)
              // Forma con funcion
              // increaseCountBy(context);
            },
          ),
    
        ],
      ),
    );
  }
}