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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //! control de todo el widget formulario, 'Form()', basado en esta key
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //! enlazamos la propiedad 'key' del Form() con la GlobalKey que nos da el control a través del Stateful Widget
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => username = value, //! podria ponerse para validar en tiempo real: _formKey.currentState?.validate(); o algo similar
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo requerido';
              if(value.trim().isEmpty ) return 'Campo requerido';
              if(value.length < 6) return 'Más de 6 letras';
              return null; // null safety
            },
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => email = value,
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo requerido';
              if(value.trim().isEmpty ) return 'Campo requerido';
              final emailRegExp = RegExp( //! Expresión regular VALIDA PARA VALIDAR CORREOS ELECTRONICOS EN PRODUCCION EN LA VIDA REAL
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if(!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';

              return null; // null safety
            },
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo requerido';
              if(value.trim().isEmpty ) return 'Campo requerido';
              if(value.length < 6) return 'Más de 6 letras';
              return null; // null safety
            },
          ),

          const SizedBox(height: 20,),
          
          FilledButton.tonalIcon(
            onPressed: (){

              //! Para activar el validator de TextFormField()
              final isValid = _formKey.currentState?.validate();
              if(isValid != null && !isValid) return;
              // print('$username, $email, $password'); //* para ver en la consola para debuggear
              //! Aqui es donde un GESTOR DE ESTADO llamaría a la función POST() para que gestione los datos con el servidor, BBDD, etc
            }, 
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
    

  }
}