import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          ListTile(
            title: const Text('Cubits'), // ! Los gestores de estado Cubits se utilizan para manejar PEQUEÑOS ESTADOS. No es recomendado para estados grandes.
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => {context.push('/cubits')},
          ),

          ListTile(
            title: const Text('Bloc'), // ! Los gestores de estado Bloc se utilizan para manejar ESTADOS COMPLEJOS.
            subtitle: const Text('Gestor de estado compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => {context.push('/bloc')},
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),

          ListTile(
            title: const Text('Nuevo usuario'), // ! Los gestores de estado Bloc se utilizan para manejar ESTADOS COMPLEJOS.
            subtitle: const Text('Manejo de formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => {context.push('/new-user')},
          ),
        ],
      ),
    );
  }
}