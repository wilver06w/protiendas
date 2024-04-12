part of 'bloc.dart';

abstract class CardFavoriteEvent extends Equatable {
  const CardFavoriteEvent();

  @override
  List<Object> get props => [];
}

class OnChangeQuantityEvent extends CardFavoriteEvent {
  const OnChangeQuantityEvent({
    required this.quantity,
  });

  final int quantity;
}
