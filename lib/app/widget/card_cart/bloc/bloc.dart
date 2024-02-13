import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocCardCart extends Bloc<CardCartEvent, CardCartState> {
  BlocCardCart({
    required this.quantity,
  }) : super(InitialState(Model(quantity: quantity))) {
    on<OnChangeQuantityEvent>(_onOnChangeQuantityEvent);
  }
  final int quantity;

  Future<void> _onOnChangeQuantityEvent(
    OnChangeQuantityEvent event,
    Emitter<CardCartState> emit,
  ) async {
    emit(
      ChangedQuantityState(
        state.model.copyWith(
          quantity: event.quantity,
        ),
      ),
    );
  }
}
