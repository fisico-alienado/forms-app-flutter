import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Es como el MultiProvider() de la Yes_no_app, tenemos que envolver con el CubitBloc todos aquellos widgets que queramos que tengan acceso al cubit en cuestión.
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseCountBy(BuildContext context, [int value = 1]){
    //* Forma valida donde es el widget el que dispara el evento
    // context.read<CounterBloc>().add(CounterIncreased(value)); //! Forma de disparar el evento -> .add(evento)
    //* Forma donde el evento lo disparamos desde el CounterBloc
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter'),
        actions: [
          IconButton(
            //* Forma valida donde es el widget el que dispara el evento
            // onPressed: () => {context.read<CounterBloc>().add(CounterReset())},
            //* Forma donde el evento lo disparamos desde el CounterBloc
            onPressed: () => {context.read<CounterBloc>().reset()},
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
                  child: BlocBuilder<CounterBloc, CounterState>(
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
                    context.select((CounterBloc counterBloc) => Text('${counterBloc.state.transactionCount}'))
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
            onPressed: () => {increaseCountBy(context, 3)},
          ),
          
          const SizedBox(height: 10,),
    
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => {increaseCountBy(context, 2)},
          ),
    
          const SizedBox(height: 10,),
    
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => {increaseCountBy(context)},
          ),
    
        ],
      ),
    );
  }
}