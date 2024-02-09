part of 'bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerEvent extends HomeEvent {}

class LoadDataCategoriasEvent extends HomeEvent {}

class OnChangeSelectedArchetypeEvent extends HomeEvent {
  const OnChangeSelectedArchetypeEvent({
    required this.value,
    required this.archetype,
  });

  final bool value;
  final Archetype archetype;
}

class DeletedByArchetypeEvent extends HomeEvent {
  const DeletedByArchetypeEvent({
    required this.archetype,
  });

  final Archetype archetype;
}

class SearchItemEvent extends HomeEvent {
  const SearchItemEvent({required this.archetype});

  final Archetype archetype;
}

class LoadBanItemsEvent extends HomeEvent {}
