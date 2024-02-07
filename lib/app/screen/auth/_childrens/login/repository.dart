import 'package:protiendas/app/models/data_login.dart';
import 'package:protiendas/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final login = '/login';

  Future<DataLogin> sendLogin(Object? data) async {
    final response = await xigoHttpClient.msDio.post(
      login,
      data: data,
    );

    return DataLogin.fromJson(response.data);
  }
}
