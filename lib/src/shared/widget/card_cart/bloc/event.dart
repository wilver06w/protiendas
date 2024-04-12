part of 'bloc.dart';

abstract class CardCartEvent extends Equatable {
  const CardCartEvent();

  @override
  List<Object> get props => [];
}

class OnChangeQuantityEvent extends CardCartEvent {
  const OnChangeQuantityEvent({
    required this.quantity,
  });

  final int quantity;
}
