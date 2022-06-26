import 'package:bloc/bloc.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';
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
  }
}
