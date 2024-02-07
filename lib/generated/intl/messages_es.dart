// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(code) =>
      "Error ${code} \nSi el error persiste, contacta a soporte";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cellPhone": MessageLookupByLibrary.simpleMessage("Celular"),
        "completeTheData":
            MessageLookupByLibrary.simpleMessage("Completa los datos"),
        "email": MessageLookupByLibrary.simpleMessage("Correo Electronico"),
        "iAmNotRegistered":
            MessageLookupByLibrary.simpleMessage("No estoy registrado"),
        "lastName": MessageLookupByLibrary.simpleMessage("Apellido"),
        "name": MessageLookupByLibrary.simpleMessage("Nombre"),
        "next": MessageLookupByLibrary.simpleMessage("Siguiente"),
        "nowYouCanLogIn":
            MessageLookupByLibrary.simpleMessage("Ahora puedes iniciar sesión"),
        "numberPhoneNoValid": MessageLookupByLibrary.simpleMessage(
            "Numero de teléfono no es válido"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "productBy":
            MessageLookupByLibrary.simpleMessage("Producto de MOTAXI S.A.S."),
        "register": MessageLookupByLibrary.simpleMessage("Registrate"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "sigIn": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "userRegisterSuccesful": MessageLookupByLibrary.simpleMessage(
            "Usuario registrado correctamente"),
        "verifyEmail": MessageLookupByLibrary.simpleMessage(
            "Verificar correo electrónico"),
        "wantRegister":
            MessageLookupByLibrary.simpleMessage("Quiero registrarme."),
        "weHaveAErrorContactSuport": m0,
        "welcome": MessageLookupByLibrary.simpleMessage("Bienvenido")
      };
}