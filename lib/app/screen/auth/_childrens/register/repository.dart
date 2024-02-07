import 'package:protiendas/app/models/message.dart';
import 'package:protiendas/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final register = '/register';

  Future<Message> sendRegister(Object? data) async {
    final response = await xigoHttpClient.msDio.post(
      register,
      data: data,
    );

    return Message.fromJson(response.data);
  }
}
