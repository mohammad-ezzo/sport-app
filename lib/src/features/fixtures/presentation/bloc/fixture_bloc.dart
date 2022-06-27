import 'package:bloc/bloc.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/lineup.dart';
import 'package:sport_app/src/features/fixtures/domain/repositories/fixtures_repository.dart';

part 'fixture_event.dart';
part 'fixture_state.dart';

class FixtureBloc extends Bloc<FixtureEvent, FixtureState> {
  final FixturesRepository _repository;
  FixtureBloc(this._repository) : super(FixtureInitial()) {
    on<GetFixturesEvent>((event, emit) async {
      emit(LoadingFixtures());
      final result = await _repository.getFixtures(
          season: event.season, leagueId: event.leagueId);
      result.fold((l) => emit(ErrorInFixtures(l.errorMessage)),
          (r) => emit(FixturesReady(r)));
    });

    on<GetLineupsEvent>((event, emit) async {
      emit(LoadingLineups());
      final result = await _repository.getLineups(fixtureId: event.fixtureId);
      result.fold((l) => emit(ErrorInLineups(l.errorMessage)),
          (r) => emit(LineupsReady(r)));
    });
  }
}
