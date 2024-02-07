// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Error {code} \nSi el error persiste, contacta a soporte`
  String weHaveAErrorContactSuport(Object code) {
    return Intl.message(
      'Error $code \nSi el error persiste, contacta a soporte',
      name: 'weHaveAErrorContactSuport',
      desc: '',
      args: [code],
    );
  }

  /// `No estoy registrado`
  String get iAmNotRegistered {
    return Intl.message(
      'No estoy registrado',
      name: 'iAmNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Quiero registrarme.`
  String get wantRegister {
    return Intl.message(
      'Quiero registrarme.',
      name: 'wantRegister',
      desc: '',
      args: [],
    );
  }

  /// `Producto de MOTAXI S.A.S.`
  String get productBy {
    return Intl.message(
      'Producto de MOTAXI S.A.S.',
      name: 'productBy',
      desc: '',
      args: [],
    );
  }

  /// `Celular`
  String get cellPhone {
    return Intl.message(
      'Celular',
      name: 'cellPhone',
      desc: '',
      args: [],
    );
  }

  /// `Numero de teléfono no es válido`
  String get numberPhoneNoValid {
    return Intl.message(
      'Numero de teléfono no es válido',
      name: 'numberPhoneNoValid',
      desc: '',
      args: [],
    );
  }

  /// `Siguiente`
  String get next {
    return Intl.message(
      'Siguiente',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Correo Electronico`
  String get email {
    return Intl.message(
      'Correo Electronico',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenido`
  String get welcome {
    return Intl.message(
      'Bienvenido',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Completa los datos`
  String get completeTheData {
    return Intl.message(
      'Completa los datos',
      name: 'completeTheData',
      desc: '',
      args: [],
    );
  }

  /// `Guardar`
  String get save {
    return Intl.message(
      'Guardar',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Verificar correo electrónico`
  String get verifyEmail {
    return Intl.message(
      'Verificar correo electrónico',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Registrate`
  String get register {
    return Intl.message(
      'Registrate',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Usuario registrado correctamente`
  String get userRegisterSuccesful {
    return Intl.message(
      'Usuario registrado correctamente',
      name: 'userRegisterSuccesful',
      desc: '',
      args: [],
    );
  }

  /// `Ahora puedes iniciar sesión`
  String get nowYouCanLogIn {
    return Intl.message(
      'Ahora puedes iniciar sesión',
      name: 'nowYouCanLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar sesión`
  String get sigIn {
    return Intl.message(
      'Iniciar sesión',
      name: 'sigIn',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get name {
    return Intl.message(
      'Nombre',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Apellido`
  String get lastName {
    return Intl.message(
      'Apellido',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
