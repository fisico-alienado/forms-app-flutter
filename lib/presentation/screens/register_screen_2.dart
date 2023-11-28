import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_bloc_app/presentation/widgets/widgets.dart';

// ! Formulario tipo 2: Aproximación con gestor de estado (Cubits al ser un pequeño formulario, pero podría ser con BLoC)
class RegisterScreenDos extends StatelessWidget {
  const RegisterScreenDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario 2'),
      ),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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

  //! control de todo el widget formulario, 'Form()', basado en esta key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    //? Lo malo es que el watch() con cada cambio del estado, como estamos utilizando el copyWith(), estamos emitiendo nuevos objetos (estados) y haciendo que se redibujen los widgets ineficientemente.
    // final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey, //! enlazamos la propiedad 'key' del Form() con la GlobalKey que nos da el control a través del Stateful Widget
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) {
              context.read<RegisterCubit>().usernameChanged(value);
              // registerCubit.usernameChanged(value);
              _formKey.currentState?.validate(); //! para validar en tiempo real
            },
            validator: (value) { //! La validación se la estamos delegando a los widgets
              if(value == null || value.isEmpty) return 'Campo requerido';
              if(value.trim().isEmpty ) return 'Campo requerido';
              if(value.length < 6) return 'Más de 6 letras';
              return null; // null safety
            },
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) {
              context.read<RegisterCubit>().emailChanged(value);
              // registerCubit.emailChanged(value);
              _formKey.currentState?.validate(); //! para validar en tiempo real
            },
            validator: (value) { //! La validación se la estamos delegando a los widgets
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
            onChanged: (value) {
              context.read<RegisterCubit>().passwordChanged(value);
              // registerCubit.passwordChanged(value);
              _formKey.currentState?.validate(); //! para validar en tiempo real
            },
            validator: (value) { //! La validación se la estamos delegando a los widgets
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
              context.read<RegisterCubit>().onSubmit(); //* para ver en la consola para debuggear
              //! Aqui es donde un GESTOR DE ESTADO llamaría a la función POST() para que gestione los datos con el servidor, BBDD, etc
            }, 
            // onPressed: null, //! Para deshabilitar el botón
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}