part of 'bloc.dart';

abstract class HomeState extends Equatable {
  final Model model;
  const HomeState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends HomeState {
  const InitialState(Model model) : super(model);
}

class LoadingListArchetypeState extends HomeState {
  const LoadingListArchetypeState(Model model) : super(model);
}

class LoadedListArchetypeState extends HomeState {
  const LoadedListArchetypeState(Model model) : super(model);
}

class ErrorListArchetypeState extends HomeState {
  const ErrorListArchetypeState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingListYuGiOhByArchetypeState extends HomeState {
  const LoadingListYuGiOhByArchetypeState(Model model) : super(model);
}

class LoadedListYuGiOhByArchetypeState extends HomeState {
  const LoadedListYuGiOhByArchetypeState(Model model) : super(model);
}

class ErrorListYuGiOhByArchetypeState extends HomeState {
  const ErrorListYuGiOhByArchetypeState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingListYuGiOhBannedState extends HomeState {
  const LoadingListYuGiOhBannedState(Model model) : super(model);
}

class LoadedListYuGiOhBannedState extends HomeState {
  const LoadedListYuGiOhBannedState(Model model) : super(model);
}

class ErrorListYuGiOhBannedState extends HomeState {
  const ErrorListYuGiOhBannedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDeleteByArchetypeState extends HomeState {
  const LoadingDeleteByArchetypeState(Model model) : super(model);
}

class LoadedDeleteByArchetypeState extends HomeState {
  const LoadedDeleteByArchetypeState(Model model) : super(model);
}

class ErrorDeleteByArchetypeState extends HomeState {
  const ErrorDeleteByArchetypeState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.listYuGiOh,
    this.listArchetype = const [],
    this.listArchetypeSelected,
    this.searchArchetype,
    this.listYuGiOhBanned = const [],
  });

  final List<YuGiOh>? listYuGiOh;
  final List<int> listYuGiOhBanned;
  final List<Archetype> listArchetype;
  final List<Archetype>? listArchetypeSelected;
  final Archetype? searchArchetype;

  Model copyWith({
    List<YuGiOh>? listYuGiOh,
    List<int>? listYuGiOhBanned,
    List<Archetype>? listArchetype,
    List<Archetype>? listArchetypeSelected,
    Archetype? searchArchetype,
  }) {
    return Model(
      listYuGiOh: listYuGiOh ?? this.listYuGiOh,
      listArchetype: listArchetype ?? this.listArchetype,
      listArchetypeSelected:
          listArchetypeSelected ?? this.listArchetypeSelected,
      searchArchetype: searchArchetype ?? this.searchArchetype,
      listYuGiOhBanned: listYuGiOhBanned ?? this.listYuGiOhBanned,
    );
  }

  List<Archetype> get getListArchetypeFilter =>
      (searchArchetype?.archetypeName ?? '').isEmpty
          ? listArchetype
          : Functions.getListFilter(
              listArchetype: listArchetype,
              search: searchArchetype ??
                  Archetype(
                    archetypeName: '',
                  ),
            );

  List<YuGiOh> get getListYuGiOhWithoutBan => Functions.getListWithOutBan(
        listYuGiOhActually: listYuGiOh ?? [],
        listYuGiOhBan: listYuGiOhBanned,
      );

  @override
  List<Object?> get props {
    return [
      listYuGiOh,
      listArchetype,
      listArchetypeSelected,
      searchArchetype,
      listYuGiOhBanned,
    ];
  }
}
