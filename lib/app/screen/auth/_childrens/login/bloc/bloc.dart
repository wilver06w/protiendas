import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/models/clien.dart';
import 'package:protiendas/app/models/data_login.dart';
import 'package:protiendas/app/models/token.dart';
import 'package:protiendas/app/screen/auth/_childrens/login/repository.dart';
import 'package:protiendas/app/screen/init/repository.dart' as repository_init;
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/http/http_client.dart';
import 'package:protiendas/app/utils/preferences.dart';

part 'event.dart';
part 'state.dart';

class BlocLogin extends Bloc<LoginEvent, LoginState> {
  BlocLogin({
    required this.prefs,
    required this.httpClient,
    required this.repository,
    required this.repositoryInit,
    required this.app,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<SendLoginEvent>(_onSendLoginEvent);
  }
  final XigoHttpClient httpClient;
  final Repository repository;
  final repository_init.Repository repositoryInit;
  final Preferences prefs;
  final AppConfig app;

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

      final dataLogin = await repository.sendLogin(data);

      final token = Token.fromJson(
        {'accessToken': dataLogin.data.accessToken},
      );
      prefs.isLogged = true;
      prefs.msToken = token;

      httpClient.updateHeadersWithToken(token);

      Clien client = await repositoryInit.getClient();
      app.clien = client;

      emit(
        LoadedLoginState(
          state.model.copyWith(
            dataLogin: dataLogin,
          ),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        emit(
          ErrorLoginState(
            model: state.model,
            message: e.response?.data['message'] ?? '',
          ),
        );
        return;
      }
      emit(
        ErrorLoginState(
          model: state.model,
          message: e.toString(),
        ),
      );
    }
  }
}
