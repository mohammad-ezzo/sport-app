part of 'fixture_bloc.dart';

abstract class FixtureState {
  const FixtureState();
}

class FixtureInitial extends FixtureState {}

class FixturesReady extends FixtureState {
  final List<Fixture> fixtures;
  FixturesReady(this.fixtures);
}

class LoadingFixtures extends FixtureState {}

class ErrorInFixtures extends FixtureState {
  final String error;
  ErrorInFixtures(this.error);
}
