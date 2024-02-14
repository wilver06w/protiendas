part of 'bloc.dart';

abstract class PaymentAddEvent extends Equatable {
  const PaymentAddEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerEvent extends PaymentAddEvent {}

class LoadDataCategoriasEvent extends PaymentAddEvent {}

class OnChangeSelectedArchetypeEvent extends PaymentAddEvent {
  const OnChangeSelectedArchetypeEvent({
    required this.value,
    required this.archetype,
  });

  final bool value;
  final Archetype archetype;
}

class DeletedByArchetypeEvent extends PaymentAddEvent {
  const DeletedByArchetypeEvent({
    required this.archetype,
  });

  final Archetype archetype;
}

class SearchItemEvent extends PaymentAddEvent {
  const SearchItemEvent({required this.archetype});

  final Archetype archetype;
}

class LoadBanItemsEvent extends PaymentAddEvent {}
