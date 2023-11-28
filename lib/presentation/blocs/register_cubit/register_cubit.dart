import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());
  //* State = Estado = new RegisterFormState(); --> Estamos creando una instancia

  void onSubmit() {
    print('Cubit submit: $state'); // Para debuggear y ver los estados
  }

  void usernameChanged (String value) {
    emit(
      state.copyWith(
        username: value
      )
    );
  }

  void emailChanged (String value) {
    emit(
      state.copyWith(
        email: value
      )
    );
  }

  void passwordChanged (String value) {
    emit(
      state.copyWith(
        password: value
      )
    );
  }

}
