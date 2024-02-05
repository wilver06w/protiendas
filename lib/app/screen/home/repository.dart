import 'package:protiendas/app/models/archetype.dart';
import 'package:protiendas/app/models/list_yugioh.dart';
import 'package:protiendas/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.yuGiOhHttpClient,
  });
  final XigoHttpClient yuGiOhHttpClient;

  final listYuGiOh = '/api/v7/cardinfo.php';
  final archetypes = '/api/v7/archetypes.php';
  final banList = '/api/v7/cardinfo.php';

  Future<List<Archetype>> getArchetypes() async {
    final response = await yuGiOhHttpClient.msDio.get(
      archetypes,
    );

    final List<dynamic> rawListData = response.data as List<dynamic>;

    final list = rawListData.map((p) => Archetype.fromJson(p)).toList();

    return list;
  }

  Future<List<YuGiOh>> getListYugiOhByArchetype(String archetype) async {
    final response = await yuGiOhHttpClient.msDio.get(
      listYuGiOh,
      queryParameters: {
        'archetype': archetype,
      },
    );

    final List<dynamic> rawListData = response.data['data'] as List<dynamic>;

    final list = rawListData.map((p) => YuGiOh.fromJson(p)).toList();

    return list;
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
