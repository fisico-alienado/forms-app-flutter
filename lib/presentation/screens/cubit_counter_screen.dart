import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc_app/presentation/bloc/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Es como el MultiProvider() de la Yes_no_app, tenemos que envolver con el CubitBloc todos aquellos widgets que queramos que tengan acceso al cubit en cuestión.
    return BlocProvider(
      create: ( _ ) => CounterCubit(), // devuelve una instancia/objeto del CounterCubit() y le de acceso a esa instancia al widget child.
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {

    //! Forma 2: Forma clásica de comunicar cambios en vez de utilizar el BlocBuilder<>: .watch() == estate pendiente del siguiente provider. 
    final counterState = context.watch<CounterCubit>().state; //* Con .state le estamos diciendo que redibuje cada vez que haya un cambio

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Cubit Counter'),
          ]),
        
        actions: [
          IconButton(
            onPressed: () => {}, 
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
                    // buildWhen: (previous, current) => current.counter != previous.counter,
                    builder: (context, state) {
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
                    Text('${counterState.transactionCount}')
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
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => {},
          ),
          
          const SizedBox(height: 10,),
    
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => {},
          ),
    
          const SizedBox(height: 10,),
    
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => {},
          ),
    
        ],
      ),
    );
  }
}