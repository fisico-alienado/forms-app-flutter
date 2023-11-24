import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(40)
    );

    return TextFormField( //? Comparar con el de la Yes-No chatbot app
      onChanged: (value) {
        print('value: $value');
      },
      validator: (value) {
        if(value == null ) return 'Campo es requerido';
        if(value.isEmpty ) return 'Campo es requerido';
        if(value.trim().isEmpty ) return 'Campo es requerido';

        return null; //! null safety
      },
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary))
      ),
    );
  }
}