part of 'bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerEvent extends DetailEvent {}

class LoadDataCategoriasEvent extends DetailEvent {}

class OnChangeSelectedArchetypeEvent extends DetailEvent {
  const OnChangeSelectedArchetypeEvent({
    required this.value,
    required this.archetype,
  });

  final bool value;
  final Archetype archetype;
}

class DeletedByArchetypeEvent extends DetailEvent {
  const DeletedByArchetypeEvent({
    required this.archetype,
  });

  final Archetype archetype;
}

class SearchItemEvent extends DetailEvent {
  const SearchItemEvent({required this.archetype});

  final Archetype archetype;
}

class LoadBanItemsEvent extends DetailEvent {}
