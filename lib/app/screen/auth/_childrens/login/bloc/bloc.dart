import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/screen/auth/_childrens/login/repository.dart';
import 'package:protiendas/app/utils/http/http_client.dart';
import 'package:protiendas/app/utils/preferences.dart';

part 'event.dart';
part 'state.dart';

class BlocLogin extends Bloc<LoginEvent, LoginState> {
  BlocLogin({
    required this.prefs,
    required this.httpClient,
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<SendLoginEvent>(_onSendLoginEvent);
  }
  final XigoHttpClient httpClient;
  final Repository repository;
  final Preferences prefs;

  void _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<LoginState> emit,
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
    Emitter<LoginState> emit,
  ) {
    emit(
      ChangedPasswordState(
        state.model.copyWith(
          password: event.password,
        ),
      ),
    );
  }

  Future<void> _onSendLoginEvent(
    SendLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoadingLoginState(state.model));

      final data = {
        'email': state.model.email,
        'password': state.model.password,
      };

      final token = await repository.sendLogin(data);

      prefs.msToken = token;
      httpClient.updateHeadersWithToken(token);

      emit(
        LoadedLoginState(
          state.model.copyWith(
              //TODO: revisar.
              // userCredential: userCredential,
              ),
        ),
      );
    } catch (error) {
      emit(
        ErrorLoginState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }
}