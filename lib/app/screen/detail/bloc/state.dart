part of 'bloc.dart';

abstract class DetailState extends Equatable {
  final Model model;
  const DetailState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DetailState {
  const InitialState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    required this.itemYugiOh,
  });

  final YuGiOh itemYugiOh;

  Model copyWith({
    YuGiOh? itemYugiOh,
  }) {
    return Model(
      itemYugiOh: itemYugiOh ?? this.itemYugiOh,
    );
  }

  @override
  List<Object?> get props {
    return [
      itemYugiOh,
    ];
  }
}
