import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/models/archetype.dart';
import 'package:protiendas/app/models/data_banner.dart';
import 'package:protiendas/app/models/data_categoria.dart';
import 'package:protiendas/app/models/list_yugioh.dart';
import 'package:protiendas/app/screen/detail/repository.dart';
import 'package:protiendas/app/utils/functions.dart';

part 'event.dart';
part 'state.dart';

class BlocDetail extends Bloc<DetailEvent, DetailState> {
  BlocDetail({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<LoadBannerEvent>(_onLoadBannerEvent);
    on<LoadDataCategoriasEvent>(_onLoadDataCategoriasEvent);
    on<OnChangeSelectedArchetypeEvent>(_onOnChangeSelectedArchetypeEvent);
    on<DeletedByArchetypeEvent>(_onDeletedByArchetypeEvent);
    on<SearchItemEvent>(_onSearchItemEvent);
    on<LoadBanItemsEvent>(_onLoadBanItemsEvent);
  }
  final Repository repository;

  Future<void> _onLoadBannerEvent(
    LoadBannerEvent event,
    Emitter<DetailState> emit,
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
    Emitter<DetailState> emit,
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

  Future<void> _onLoadBanItemsEvent(
    LoadBanItemsEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(LoadingDataCategoriasState(state.model));

      final listYuGiOhBanned = await repository.getListBan();

      emit(
        LoadedListYuGiOhBannedState(
          state.model.copyWith(
            listYuGiOhBanned: listYuGiOhBanned,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorListYuGiOhBannedState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onOnChangeSelectedArchetypeEvent(
    OnChangeSelectedArchetypeEvent event,
    Emitter<DetailState> emit,
  ) async {
    if (event.value) {
    } else {
      add(DeletedByArchetypeEvent(archetype: event.archetype));
    }
  }

  Future<void> _onDeletedByArchetypeEvent(
    DeletedByArchetypeEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(LoadingDeleteByArchetypeState(state.model));

      emit(
        LoadedDeleteByArchetypeState(
          state.model.copyWith(),
        ),
      );
    } catch (error) {
      emit(
        ErrorDeleteByArchetypeState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onSearchItemEvent(
    SearchItemEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(LoadingDeleteByArchetypeState(state.model));

      emit(
        LoadedDeleteByArchetypeState(
          state.model.copyWith(
            searchArchetype: event.archetype,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDeleteByArchetypeState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }
}
