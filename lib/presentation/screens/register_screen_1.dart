import 'package:flutter/material.dart';
import 'package:forms_bloc_app/presentation/widgets/widgets.dart';


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
    return const SafeArea( // WIDGET DE FLUTTER QUE PROTEGE AUTOMATICAMENTE LAS ZONAS DE ARRIBA Y ABAJO DE MOVILES CON isla dinamica o botones
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView( // ! Para evitar errores de overflow de contenido y permitir hacer scroll del contenido
          child: Column(
            children: [
              FlutterLogo(size: 100,),

              _RegisterForm(),

              SizedBox(height: 20,),

            ]
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          CustomTextFormField(),
          const SizedBox(height: 10,),
          CustomTextFormField(),
          const SizedBox(height: 10,),
          CustomTextFormField(),

          const SizedBox(height: 20,),
          
          FilledButton.tonalIcon(
            onPressed: (){}, 
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
    

  }
}