part of 'fixture_bloc.dart';

abstract class FixtureState {
  const FixtureState();
}

class FixtureInitial extends FixtureState {}

class FixturesReady extends FixtureState {
  final List<Fixture> fixtures;
  FixturesReady(this.fixtures);
}

class LineupsReady extends FixtureState {
  final List<Lineup> lineups;
  LineupsReady(this.lineups);
}

class LoadingFixtures extends FixtureState {}

class LoadingLineups extends FixtureState {}

class ErrorInFixtures extends FixtureState {
  final String error;
  ErrorInFixtures(this.error);
}

class ErrorInLineups extends FixtureState {
  final String error;
  ErrorInLineups(this.error);
}
