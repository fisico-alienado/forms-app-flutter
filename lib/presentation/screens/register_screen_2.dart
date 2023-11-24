import 'package:flutter/material.dart';

// ! Formulario tipo 2: Aproximación con gestor de estado (BLoC en este caso, pero podría ser cualquiera)
class RegisterScreenDos extends StatelessWidget {
  const RegisterScreenDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}