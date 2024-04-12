import 'package:dartz/dartz.dart';
import 'package:protiendas/src/core/network/failures.dart';
import 'package:protiendas/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:protiendas/src/shared/models/data_categoria.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<int>>> getListBan();
  Future<Either<Failure, DataBanner>> getBanner();
  Future<Either<Failure, DataCategoria>> getCategorias();
}
