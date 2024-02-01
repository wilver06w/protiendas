import 'package:dio/dio.dart';
import 'package:yugioh/app/utils/http/dio.dart';

export 'package:dio/dio.dart';
export 'package:flutter_modular/flutter_modular.dart';

class YuGiOhHttpClient {
  YuGiOhHttpClient._();
  static final _singleton = YuGiOhHttpClient._();

  factory YuGiOhHttpClient() => _singleton;

  late YuGiOhSharedDio _msDio;

  Dio get msDio => _msDio.dio;
  YuGiOhSharedDio get verifikSharedDio => _msDio;

  YuGiOhHttpClient getInstance() {
    _singleton._msDio = YuGiOhSharedDio(
      baseUrl: 'https://db.ygoprodeck.com',
    );
    return _singleton;
  }
}
