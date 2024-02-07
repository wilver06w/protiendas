import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/models/token.dart';
import 'package:protiendas/app/screen/auth/_childrens/register/repository.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/http/http_client.dart';
import 'package:protiendas/app/utils/preferences.dart';

import '../../../../../models/data_login.dart';

part 'event.dart';
part 'state.dart';

class BlocRegister extends Bloc<RegisterEvent, RegisterState> {
  BlocRegister({
    required this.httpClient,
    required this.prefs,
    required this.appConfig,
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<SendRegisterEvent>(_onSendRegisterEvent);
    on<ChangeNameEvent>(_onChangeNameEvent);
    on<ChangeLastNameEvent>(_onChangeLastNameEvent);
  }
  final Repository repository;
  final XigoHttpClient httpClient;
  final AppConfig appConfig;
  final Preferences prefs;

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
      final dataLogin = await repository.sendRegister(data);
      appConfig.clien = dataLogin.data.userData;

      final token = Token.fromJson(
        {'accessToken': dataLogin.data.accessToken},
      );
      prefs.isLogged = true;
      prefs.msToken = token;

      httpClient.updateHeadersWithToken(token);

      emit(
        LoadedRegisterState(
          state.model.copyWith(
            dataLogin: dataLogin,
          ),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        emit(
          ErrorRegisterState(
            model: state.model,
            message: e.response?.data['message'] ?? '',
          ),
        );
        return;
      }
      emit(
        ErrorRegisterState(
          model: state.model,
          message: e.toString(),
        ),
      );
    }
  }
}
