import 'package:protiendas/app/models/token.dart';
import 'package:protiendas/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final login = '/login';

  Future<Token> sendLogin(Object? data) async {
    final response = await xigoHttpClient.msDio.post(
      login,
      data: data,
    );

    return Token.fromJson(response.data);
  }
}
