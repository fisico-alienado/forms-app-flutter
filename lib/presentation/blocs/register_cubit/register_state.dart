part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

//! Este Cubit está creado con la intención de que maneje el estado del formulario
class RegisterFormState extends Equatable {
  
  final String username;
  final String email;
  final String password;
  final FormStatus formStatus;

  const RegisterFormState({
    this.username = '', 
    this.email = '', 
    this.password = '', 
    this.formStatus = FormStatus.invalid
  }); //* Propiedad para comprobar el estado del formulario, util en la vida real para hacer llamadas a la BBDD y validar

  //! Es una forma de hacer una copia de clases (del CounterState actual en este caso) y EMITIR NUEVOS ESTADOS
  //! De esta manera podemos mantener la clase (RegisterFormState) INMUTABLE y, cuando se quiera cambiar algo, se hace una copia de ella
  RegisterFormState copyWith({
    String? username,
    String? email,
    String? password,
    FormStatus? formStatus
  }) => RegisterFormState(
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    formStatus: formStatus ?? this.formStatus,
  );

  @override
  List<Object> get props => [username, email, password, formStatus]; //! para que dos estados sean iguales tienen que tener TODAS esas propiedades identicas
                                                                     //! en caso de ser iguales, le indicamos a Cubit que no haga ni redibuje ningún widget
}