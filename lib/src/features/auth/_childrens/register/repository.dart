import 'package:protiendas/src/shared/models/data_login.dart';
import 'package:protiendas/src/core/network/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final register = '/registro';

  Future<DataLogin> sendRegister(Object? data) async {
    final response = await xigoHttpClient.msDio.post(
      register,
      data: data,
    );

    return DataLogin.fromJson(response.data);
  }
}
