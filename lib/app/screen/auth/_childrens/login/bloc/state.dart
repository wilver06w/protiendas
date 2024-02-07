part of 'bloc.dart';

abstract class LoginState extends Equatable {
  final Model model;
  const LoginState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends LoginState {
  const InitialState(Model model) : super(model);
}

class ChangedEmailState extends LoginState {
  const ChangedEmailState(Model model) : super(model);
}

class ChangedPasswordState extends LoginState {
  const ChangedPasswordState(Model model) : super(model);
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState(Model model) : super(model);
}

class LoadedLoginState extends LoginState {
  const LoadedLoginState(Model model) : super(model);
}

class ErrorLoginState extends LoginState {
  const ErrorLoginState({required Model model, required this.message})
      : super(model);
  final String message;
}

class Model extends Equatable {
  const Model({
    this.email = '',
    this.password = '',
    // this.userCredential,
  });

  final String email;
  final String password;
  //TODO: revisar
  // final UserCredential? userCredential;

  bool get isFormFilledLogin => (email.isNotEmpty) && (password.isNotEmpty);

  Model copyWith({
    String? email,
    String? password,
    // UserCredential? userCredential,
  }) {
    return Model(
      email: email ?? this.email,
      password: password ?? this.password,
      // userCredential: userCredential ?? this.userCredential,
    );
  }

  @override
  List<Object?> get props {
    return [
      email,
      password,
      // userCredential,
    ];
  }
}
