part of 'bloc.dart';

@immutable
abstract class AppConfigState extends Equatable {
  final Model model;
  const AppConfigState(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends AppConfigState {
  const InitialState(Model model) : super(model);
}

class ChangedClientState extends AppConfigState {
  const ChangedClientState(Model model) : super(model);
}

class ChangedCountryState extends AppConfigState {
  const ChangedCountryState(Model model) : super(model);
}

class ChangedBusinessBuilderState extends AppConfigState {
  const ChangedBusinessBuilderState(Model model) : super(model);
}

class Model extends Equatable {
  final Client? client;
  final Country country;

  const Model({
    this.client,
    required this.country,
  });

  Model copyWith({
    Client? client,
    Country? country,
  }) {
    return Model(
      client: client ?? this.client,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props {
    return [
      client,
      country,
    ];
  }
}
