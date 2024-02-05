part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeKeyEvent extends Event {}

class CloseKeyboardEvent extends Event {}
