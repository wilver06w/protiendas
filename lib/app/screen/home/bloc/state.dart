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

class LoadingBannerState extends HomeState {
  const LoadingBannerState(Model model) : super(model);
}

class LoadedBannerState extends HomeState {
  const LoadedBannerState(Model model) : super(model);
}

class ErrorBannerState extends HomeState {
  const ErrorBannerState({
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
    this.dataBanner,
    this.listArchetypeSelected,
    this.searchArchetype,
    this.listYuGiOhBanned = const [],
  });

  final List<YuGiOh>? listYuGiOh;
  final List<int> listYuGiOhBanned;
  final DataBanner? dataBanner;
  final List<Archetype>? listArchetypeSelected;
  final Archetype? searchArchetype;

  Model copyWith({
    List<YuGiOh>? listYuGiOh,
    List<int>? listYuGiOhBanned,
    DataBanner? dataBanner,
    List<Archetype>? listArchetypeSelected,
    Archetype? searchArchetype,
  }) {
    return Model(
      listYuGiOh: listYuGiOh ?? this.listYuGiOh,
      dataBanner: dataBanner ?? this.dataBanner,
      listArchetypeSelected:
          listArchetypeSelected ?? this.listArchetypeSelected,
      searchArchetype: searchArchetype ?? this.searchArchetype,
      listYuGiOhBanned: listYuGiOhBanned ?? this.listYuGiOhBanned,
    );
  }

  List<Archetype> get getListArchetypeFilter => [];

  List<YuGiOh> get getListYuGiOhWithoutBan => Functions.getListWithOutBan(
        listYuGiOhActually: listYuGiOh ?? [],
        listYuGiOhBan: listYuGiOhBanned,
      );

  @override
  List<Object?> get props {
    return [
      listYuGiOh,
      dataBanner,
      listArchetypeSelected,
      searchArchetype,
      listYuGiOhBanned,
    ];
  }
}
