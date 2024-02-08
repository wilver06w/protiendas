import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/models/archetype.dart';
import 'package:protiendas/app/models/data_banner.dart';
import 'package:protiendas/app/models/list_yugioh.dart';
import 'package:protiendas/app/screen/home/repository.dart';
import 'package:protiendas/app/utils/functions.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<LoadBannerEvent>(_onLoadBannerEvent);
    on<LoadListYugiOhByArchetypeEvent>(_onLoadListYugiOhByArchetypeEvent);
    on<OnChangeSelectedArchetypeEvent>(_onOnChangeSelectedArchetypeEvent);
    on<DeletedByArchetypeEvent>(_onDeletedByArchetypeEvent);
    on<SearchItemEvent>(_onSearchItemEvent);
    on<LoadBanItemsEvent>(_onLoadBanItemsEvent);
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

  Future<void> _onLoadListYugiOhByArchetypeEvent(
    LoadListYugiOhByArchetypeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingListYuGiOhByArchetypeState(state.model));

      final listYuGiOh = await repository.getListYugiOhByArchetype(
        event.archetype.archetypeName,
      );

      emit(
        LoadedListYuGiOhByArchetypeState(
          state.model.copyWith(
            listYuGiOh: (state.model.listYuGiOh ?? [])..addAll(listYuGiOh),
            listArchetypeSelected: (state.model.listArchetypeSelected ?? [])
              ..add(
                event.archetype,
              ),
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorListYuGiOhByArchetypeState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadBanItemsEvent(
    LoadBanItemsEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingListYuGiOhBannedState(state.model));

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
    Emitter<HomeState> emit,
  ) async {
    if (event.value) {
      add(LoadListYugiOhByArchetypeEvent(archetype: event.archetype));
    } else {
      add(DeletedByArchetypeEvent(archetype: event.archetype));
    }
  }

  Future<void> _onDeletedByArchetypeEvent(
    DeletedByArchetypeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingDeleteByArchetypeState(state.model));

      final listYuGiOhActualy = state.model.listYuGiOh;
      listYuGiOhActualy?.removeWhere(
        (element) => (element.archetype ?? '').contains(
          event.archetype.archetypeName,
        ),
      );
      final listArchetypeActualy = state.model.listArchetypeSelected;
      listArchetypeActualy?.removeWhere(
        (element) => element == event.archetype,
      );

      emit(
        LoadedDeleteByArchetypeState(
          state.model.copyWith(
            listYuGiOh: listYuGiOhActualy,
            listArchetypeSelected: listArchetypeActualy,
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

  Future<void> _onSearchItemEvent(
    SearchItemEvent event,
    Emitter<HomeState> emit,
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
