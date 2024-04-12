import 'package:protiendas/src/shared/models/clien.dart';
import 'package:protiendas/src/core/network/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final register = '/registro';
  final user = '/clientes';

  Future<Clien> getClient() async {
    final response = await xigoHttpClient.msDio.get(user);

    return Clien.fromJson(response.data["data"]);
  }
}
