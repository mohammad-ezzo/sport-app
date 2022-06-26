part of 'fixture_bloc.dart';

abstract class FixtureEvent {
  const FixtureEvent();
}

class GetFixturesEvent extends FixtureEvent {
  final String leagueId;
  final String season;
  GetFixturesEvent({required this.leagueId, required this.season});
}
