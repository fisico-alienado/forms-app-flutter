import 'package:flutter/material.dart';


// ! Formulario tipo 1: Aproximación tradicional con Stateful (Forms, TextFormField + Keys)
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
    return SafeArea( // WIDGET DE FLUTTER QUE PROTEGE AUTOMATICAMENTE LAS ZONAS DE ARRIBA Y ABAJO DE MOVILES CON isla dinamica o botones
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView( // ! Para evitar errores de overflow de contenido y permitir hacer scroll del contenido
          child: Column(
            children: [
              const FlutterLogo(size: 100,),

              TextFormField(),
              TextFormField(),
              TextFormField(),

              const SizedBox(height: 20,),
              
              FilledButton.tonalIcon(
                onPressed: (){}, 
                icon: const Icon(Icons.save),
                label: const Text('Crear usuario'),
              ),

              const SizedBox(height: 20,),

            ]
          ),
        ),
      ),
    );
  }
}