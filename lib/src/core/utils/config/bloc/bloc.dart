import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:protiendas/src/shared/models/clien.dart';
import 'package:protiendas/src/shared/models/client.dart';
import 'package:protiendas/src/shared/models/country/country.dart';

part 'event.dart';
part 'state.dart';

class AppConfigBloc extends bloc.Bloc<Event, AppConfigState> {
  final Country country;

  AppConfigBloc(this.country) : super(InitialState(Model(country: country))) {
    on<ChangeClientEvent>(_changeClientEvent);
    on<ChangeClienEvent>(_changeClienEvent);
    on<ChangeCountryEvent>(_changeCountryEvent);
  }

  void _changeClientEvent(
    ChangeClientEvent event,
    Emitter<AppConfigState> emit,
  ) async {
    emit(
      ChangedClientState(
        state.model.copyWith(
          client: event.client,
        ),
      ),
    );
  }

  void _changeClienEvent(
    ChangeClienEvent event,
    Emitter<AppConfigState> emit,
  ) async {
    emit(
      ChangedClientState(
        state.model.copyWith(
          clien: event.clien,
        ),
      ),
    );
  }

  void _changeCountryEvent(
    ChangeCountryEvent event,
    Emitter<AppConfigState> emit,
  ) async {
    emit(
      ChangedCountryState(
        state.model.copyWith(
          country: event.country,
        ),
      ),
    );
  }
}
