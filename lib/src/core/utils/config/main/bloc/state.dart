part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class ChangedKeyState extends State {
  const ChangedKeyState(Model model) : super(model);
}

class CloseKeyboardState extends State {
  const CloseKeyboardState(Model model) : super(model);
}

class FailureState extends State {
  final String error;
  final State lastState;

  const FailureState({
    required Model model,
    required this.error,
    required this.lastState,
  }) : super(model);

  @override
  List<Object?> get props => [error, lastState, model];
}

class Model extends Equatable {
  final UniqueKey key;

  const Model({required this.key});

  Model copyWith({
    UniqueKey? key,
  }) =>
      Model(
        key: key ?? this.key,
      );

  @override
  List<Object?> get props => [key];
}
