import 'package:protiendas/src/core/network/exceptions.dart';
import 'package:protiendas/src/core/network/http_client.dart';
import 'package:protiendas/src/features/dashbo/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:protiendas/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:protiendas/src/shared/models/data_categoria.dart';

class HomeImplApi extends AbstractHomeApi {
  HomeImplApi({
    required this.xigoHttpClient,
  });
  final XigoHttpClient xigoHttpClient;

  final banners = '/utils/banners';
  final categorias = '/categorias';
  final banList = '/api/v7/cardinfo.php';

  // ListBan Method
  @override
  Future<List<int>> getListBan() async {
    final response = await xigoHttpClient.msDio.get(
      banList,
      queryParameters: {
        'banlist': 'tcg',
      },
    );

    final List<dynamic> rawListData = response.data['data'] as List<dynamic>;

    final listIds = rawListData.map((p) => (p["id"] ?? 0) as int).toList();

    return listIds;
  }

  @override
  Future<DataBanner> getBanner() async {
    final response = await xigoHttpClient.msDio.get(banners);

    return DataBanner.fromJson(response.data);
  }

  @override
  Future<DataCategoria> getCategorias() async {
    try {
      final response = await xigoHttpClient.msDio.get(categorias);

      return DataCategoria.fromJson(response.data);
    } on ServerException catch (e) {
      throw ServerException(e.message, e.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
