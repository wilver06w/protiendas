import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/screen/auth/_childrens/register/repository.dart';

part 'event.dart';
part 'state.dart';

class BlocRegister extends Bloc<RegisterEvent, RegisterState> {
  BlocRegister({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<SendRegisterEvent>(_onSendRegisterEvent);
    on<ChangeNameEvent>(_onChangeNameEvent);
    on<ChangeLastNameEvent>(_onChangeLastNameEvent);
  }
  final Repository repository;

  void _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedEmailState(
        state.model.copyWith(
          email: event.email,
        ),
      ),
    );
  }

  void _onChangePasswordEvent(
    ChangePasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedPasswordState(
        state.model.copyWith(
          password: event.password,
        ),
      ),
    );
  }

  void _onChangeNameEvent(
    ChangeNameEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedNameState(
        state.model.copyWith(
          name: event.name,
        ),
      ),
    );
  }

  void _onChangeLastNameEvent(
    ChangeLastNameEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedLastNameState(
        state.model.copyWith(
          lastName: event.lastName,
        ),
      ),
    );
  }

  Future<void> _onSendRegisterEvent(
    SendRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(LoadingRegisterState(state.model));

      final data = {
        'nombre': state.model.name,
        'apellido': state.model.lastName,
        'email': state.model.email,
        'password': state.model.password,
      };
      await repository.sendRegister(data);

      emit(
        LoadedRegisterState(
          state.model.copyWith(
              //TODO: revisar
              // userCredential: userCredential,
              ),
        ),
      );
    } catch (error) {
      emit(
        ErrorRegisterState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }
}
