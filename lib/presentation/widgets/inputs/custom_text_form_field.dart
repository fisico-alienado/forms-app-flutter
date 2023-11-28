import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  //! Para controlar las propiedades del TextFormField, ponemos el cursor encima de sus parámetros y vemos el tipo de datos que esperan recibir
  //! Estamos delegando las propiedades a la zona donde se va a utilizar para que sea 100% customizable
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(40)
    );

    return TextFormField( //? Comparar con el de la Yes-No chatbot app
      // onChanged: (value) {
      //   print('value: $value');
      // },
      // validator: (value) {
      //   if(value == null ) return 'Campo es requerido';
      //   if(value.isEmpty ) return 'Campo es requerido';
      //   if(value.trim().isEmpty ) return 'Campo es requerido';

      //   return null; //! null safety
      // },
      onChanged: onChanged, // El mismo valor que emite es el que va a mandar en la función se difina
      validator: validator, // El mismo valor que emite es el que va a mandar en la función se difina
      obscureText: obscureText, //* son los puntitos que ocultan el texto que se utilizan en los campos de contraseñas
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: label != null ? Text('$label') : null, // necesario null safety porque le estamos pasando 'label' a un Widget
        hintText: hint,
        focusColor: colors.primary,        
        // icon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary,),
        // prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary,)
        // suffixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary,)        
        errorText: errorMessage,
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800))

      ),
    );
  }
}