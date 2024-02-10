import 'package:protiendas/app/models/clien.dart';
import 'package:protiendas/app/utils/http/http_client.dart';

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
