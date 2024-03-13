import 'package:protiendas/src/core/network/http_client.dart';
import 'package:protiendas/src/features/dashbo/home/data/data_sources/remote/home_impl_api.dart';
import 'package:protiendas/src/features/dashbo/home/data/repositories/home_repo_impl.dart';
import 'package:protiendas/src/features/dashbo/home/domain/repositories/abstract_home_repository.dart';
import 'package:protiendas/src/features/dashbo/home/domain/usecases/banlist_usecase.dart';
import 'package:protiendas/src/features/dashbo/home/domain/usecases/banner_usecase.dart';
import 'package:protiendas/src/features/dashbo/home/domain/usecases/categorias_usecase.dart';

class InjectHomeUseCase {
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => ArticlesImplApi(
        xigoHttpClient: i<XigoHttpClient>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => ArticlesRepositoryImpl(
        articlesApi: i<ArticlesImplApi>(),
      ),
    ),
    Bind.lazySingleton((i) => AbstractHomeRepository),
    Bind.lazySingleton(
        (i) => ListBanUseCase(repository: i<AbstractHomeRepository>())),
    Bind.lazySingleton(
        (i) => BannerUseCase(repository: i<AbstractHomeRepository>())),
    Bind.lazySingleton(
        (i) => CategoriesUseCase(repository: i<AbstractHomeRepository>())),
  ];
}
