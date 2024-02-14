import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/models/data_citys.dart';
import 'package:protiendas/app/models/data_departament.dart';
import 'package:protiendas/app/screen/addresses/add/repository.dart';

part 'event.dart';
part 'state.dart';

class BlocAddAddress extends Bloc<AddAddressEvent, AddAddressState> {
  BlocAddAddress({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<LoadDeapartamentEvent>(_onLoadDeapartamentEvent);
    on<ChangedDepartamentSelectedEvent>(_onChangedDepartamentSelectedEvent);
    on<ChangedCitySelectedEvent>(_onChangedCitySelectedEvent);
    on<LoadCityEvent>(_onLoadCityEvent);
  }
  final Repository repository;

  Future<void> _onLoadDeapartamentEvent(
    LoadDeapartamentEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    try {
      emit(LoadingDepartamentState(state.model));

      final dataDepartament = await repository.getDepartaments();

      emit(
        LoadedDepartamentState(
          state.model.copyWith(
            dataDepartament: dataDepartament,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDepartamentState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadCityEvent(
    LoadCityEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    try {
      emit(LoadingDepartamentState(state.model));

      final dataCitys = await repository.getCitys(
        event.departamentSelected.id,
      );

      emit(
        LoadedDepartamentState(
          state.model.copyWith(
            dataCitys: dataCitys,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDepartamentState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onChangedDepartamentSelectedEvent(
    ChangedDepartamentSelectedEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(ChangedDepartamentSelectedState(
      state.model.copyWith(
        departamentSelected: event.departamentSelected,
      ),
    ));
  }

  Future<void> _onChangedCitySelectedEvent(
    ChangedCitySelectedEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(ChangedDepartamentSelectedState(
      state.model.copyWith(
        citySelected: event.citySelected,
      ),
    ));
  }
}
