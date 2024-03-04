import 'package:url_launcher/url_launcher.dart';
import 'package:protiendas/app/models/archetype.dart';
import 'package:protiendas/src/shared/models/list_yugioh.dart';

class Functions {
  static Future<void> launchInBrowser({required String url}) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  static List<Archetype> getListFilter({
    required List<Archetype> listArchetype,
    required Archetype search,
  }) {
    final listFilter = listArchetype
        .where(
          (element) => element.archetypeName.contains(search.archetypeName),
        )
        .toList();
    return listFilter;
  }

  static List<YuGiOh> getListWithOutBan({
    required List<YuGiOh> listYuGiOhActually,
    required List<int> listYuGiOhBan,
  }) {
    List<YuGiOh> listYuGi = [];

    for (YuGiOh elementItem in listYuGiOhActually) {
      if (!listYuGiOhBan.contains(elementItem.id)) {
        listYuGi.add(elementItem);
      }
    }
    return listYuGi;
  }

  static List<String> moths = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
  ];
}
