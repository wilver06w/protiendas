import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/src/core/utils/config/main/bloc/bloc.dart' as app;

class ProtiendasKeyboard {
  static close() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await Future.delayed(Duration.zero);
    final appBloc = Modular.get<app.Bloc>();
    appBloc.add(app.CloseKeyboardEvent());
  }
}
