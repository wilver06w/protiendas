part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeClientEvent extends Event {
  final Client? client;

  ChangeClientEvent(this.client);
}

class ChangeClienEvent extends Event {
  final Clien? clien;

  ChangeClienEvent(this.clien);
}

class ChangeCountryEvent extends Event {
  final Country country;

  ChangeCountryEvent(this.country);
}
