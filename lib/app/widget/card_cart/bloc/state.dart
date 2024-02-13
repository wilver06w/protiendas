part of 'bloc.dart';

abstract class CardCartState extends Equatable {
  final Model model;
  const CardCartState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends CardCartState {
  const InitialState(Model model) : super(model);
}

class ChangedQuantityState extends CardCartState {
  const ChangedQuantityState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    required this.quantity,
  });

  final int quantity;

  Model copyWith({
    int? quantity,
  }) {
    return Model(
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props {
    return [quantity];
  }
}
