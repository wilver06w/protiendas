import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc() : super(initialState) {
    on<ChangeKeyEvent>(_onLoadEvent);
    on<CloseKeyboardEvent>(_onCloseKeyboardEvent);
  }

  static State get initialState => InitialState(
        Model(key: UniqueKey()),
      );

  void _onLoadEvent(ChangeKeyEvent event, Emitter<State> emit) {
    emit(
      ChangedKeyState(
        state.model.copyWith(
          key: UniqueKey(),
        ),
      ),
    );
  }

  void _onCloseKeyboardEvent(CloseKeyboardEvent event, Emitter<State> emit) {
    emit(
      CloseKeyboardState(
        state.model.copyWith(
          key: UniqueKey(),
        ),
      ),
    );
  }
}
