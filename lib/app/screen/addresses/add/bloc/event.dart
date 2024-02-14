part of 'bloc.dart';

abstract class AddAddressEvent extends Equatable {
  const AddAddressEvent();

  @override
  List<Object> get props => [];
}

class LoadDeapartamentEvent extends AddAddressEvent {}

class ChangedDepartamentSelectedEvent extends AddAddressEvent {
  const ChangedDepartamentSelectedEvent({
    required this.departamentSelected,
  });

  final Datum departamentSelected;
}

class ChangedCitySelectedEvent extends AddAddressEvent {
  const ChangedCitySelectedEvent({
    required this.citySelected,
  });

  final City citySelected;
}

class LoadCityEvent extends AddAddressEvent {
  const LoadCityEvent({required this.departamentSelected});
  final Datum departamentSelected;
}
