import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:protiendas/src/features/dashbo/repository.dart';
import 'package:protiendas/src/shared/models/data_categoria.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<LoadBannerEvent>(_onLoadBannerEvent);
    on<LoadDataCategoriasEvent>(_onLoadDataCategoriasEvent);
  }
  final Repository repository;

  Future<void> _onLoadBannerEvent(
    LoadBannerEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingBannerState(state.model));

      final dataBanner = await repository.getBanner();

      emit(
        LoadedBannerState(
          state.model.copyWith(
            dataBanner: dataBanner,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorBannerState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadDataCategoriasEvent(
    LoadDataCategoriasEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingDataCategoriasState(state.model));

      final dataCategoria = await repository.getCategorias();

      emit(
        LoadedDataCategoriasState(
          state.model.copyWith(
            dataCategoria: dataCategoria,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDataCategoriasState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }
}
