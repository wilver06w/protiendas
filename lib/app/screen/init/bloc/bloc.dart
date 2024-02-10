import 'dart:async';

import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/models/clien.dart';
import 'package:protiendas/app/screen/init/repository.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/http/http_client.dart';
import 'package:protiendas/app/utils/http/token.dart';
import 'package:protiendas/app/utils/preferences.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc({
    required this.repository,
    required this.tokenRepository,
    required this.httpClient,
    required this.app,
    required this.prefs,
  }) : super(const InitialState(Model())) {
    on<InitEvent>(_onLoadEvent);
  }

  final TokenRepository tokenRepository;
  final Repository repository;
  final XigoHttpClient httpClient;
  final AppConfig app;
  final Preferences prefs;

  Future<void> _onLoadEvent(
    InitEvent event,
    Emitter<State> emit,
  ) async {
    try {
      await isTokenExpired();

      if (!prefs.isLogged || tokenRepository.isTokenExpired(prefs.msToken)) {
        emit(
          UnLoggedState(
            state.model.copyWith(
              key: UniqueKey(),
            ),
          ),
        );
        return;
      }
      Clien client = await repository.getClient();
      app.clien = client;

      emit(LoadedState(state.model));
    } catch (e) {
      emit(ErrorState(state.model));
    }
  }

  Future<void> isTokenExpired() async {
    if (tokenRepository.isTokenExpired(prefs.msToken)) {
      await tokenRepository.refreshToken(
        prefs: prefs,
        httpClient: httpClient,
      );
      prefs.reload();
    }
  }
}
