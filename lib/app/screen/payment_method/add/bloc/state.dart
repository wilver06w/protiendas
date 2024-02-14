part of 'bloc.dart';

abstract class PaymentAddState extends Equatable {
  final Model model;
  const PaymentAddState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends PaymentAddState {
  const InitialState(Model model) : super(model);
}

class LoadingBannerState extends PaymentAddState {
  const LoadingBannerState(Model model) : super(model);
}

class LoadedBannerState extends PaymentAddState {
  const LoadedBannerState(Model model) : super(model);
}

class ErrorBannerState extends PaymentAddState {
  const ErrorBannerState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingListYuGiOhByArchetypeState extends PaymentAddState {
  const LoadingListYuGiOhByArchetypeState(Model model) : super(model);
}

class LoadedDataCategoriasState extends PaymentAddState {
  const LoadedDataCategoriasState(Model model) : super(model);
}

class ErrorDataCategoriasState extends PaymentAddState {
  const ErrorDataCategoriasState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDataCategoriasState extends PaymentAddState {
  const LoadingDataCategoriasState(Model model) : super(model);
}

class LoadedListYuGiOhBannedState extends PaymentAddState {
  const LoadedListYuGiOhBannedState(Model model) : super(model);
}

class ErrorListYuGiOhBannedState extends PaymentAddState {
  const ErrorListYuGiOhBannedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDeleteByArchetypeState extends PaymentAddState {
  const LoadingDeleteByArchetypeState(Model model) : super(model);
}

class LoadedDeleteByArchetypeState extends PaymentAddState {
  const LoadedDeleteByArchetypeState(Model model) : super(model);
}

class ErrorDeleteByArchetypeState extends PaymentAddState {
  const ErrorDeleteByArchetypeState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.dataCategoria,
    this.dataBanner,
    this.listArchetypeSelected,
    this.searchArchetype,
    this.listYuGiOhBanned = const [],
  });

  final DataCategoria? dataCategoria;
  final List<int> listYuGiOhBanned;
  final DataBanner? dataBanner;
  final List<Archetype>? listArchetypeSelected;
  final Archetype? searchArchetype;

  Model copyWith({
    DataCategoria? dataCategoria,
    List<int>? listYuGiOhBanned,
    DataBanner? dataBanner,
    List<Archetype>? listArchetypeSelected,
    Archetype? searchArchetype,
  }) {
    return Model(
      dataCategoria: dataCategoria ?? this.dataCategoria,
      dataBanner: dataBanner ?? this.dataBanner,
      listArchetypeSelected:
          listArchetypeSelected ?? this.listArchetypeSelected,
      searchArchetype: searchArchetype ?? this.searchArchetype,
      listYuGiOhBanned: listYuGiOhBanned ?? this.listYuGiOhBanned,
    );
  }

  List<Archetype> get getListArchetypeFilter => [];

  List<YuGiOh> get getListYuGiOhWithoutBan => Functions.getListWithOutBan(
        listYuGiOhActually: [],
        listYuGiOhBan: listYuGiOhBanned,
      );

  @override
  List<Object?> get props {
    return [
      dataCategoria,
      dataBanner,
      listArchetypeSelected,
      searchArchetype,
      listYuGiOhBanned,
    ];
  }
}
