import 'package:protiendas/app/models/data_banner.dart';
import 'package:protiendas/app/models/data_categoria.dart';
import 'package:protiendas/app/models/list_yugioh.dart';
import 'package:protiendas/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.yuGiOhHttpClient,
  });
  final XigoHttpClient yuGiOhHttpClient;

  final banners = '/utils/banners';
  final categorias = '/categorias';
  final banList = '/api/v7/cardinfo.php';

  Future<DataBanner> getBanner() async {
    final response = await yuGiOhHttpClient.msDio.get(banners);

    return DataBanner.fromJson(response.data);
  }

  Future<DataCategoria> getCategorias() async {
    final response = await yuGiOhHttpClient.msDio.get(categorias);

    return DataCategoria.fromJson(response.data);
  }

  Future<List<int>> getListBan() async {
    final response = await yuGiOhHttpClient.msDio.get(
      banList,
      queryParameters: {
        'banlist': 'tcg',
      },
    );

    final List<dynamic> rawListData = response.data['data'] as List<dynamic>;

    final listIds = rawListData.map((p) => (p["id"] ?? 0) as int).toList();

    return listIds;
  }
}
