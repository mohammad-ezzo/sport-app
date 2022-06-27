import 'package:dartz/dartz.dart';
import 'package:sport_app/src/core/exceptions/exceptions.dart';
import 'package:sport_app/src/core/exceptions/failures.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/lineup.dart';
import '../../domain/repositories/fixtures_repository.dart';
import '../data_sources/fixtures_api.dart';
import '../data_sources/fixtures_shared_prefs.dart';
import 'package:sport_app/src/core/extentions.dart';

class FixturesRepositoryImpl extends FixturesRepository {
  final FixturesApi fixturesApi;
  final FixturesSharedPrefs fixturesPrefs;
  FixturesRepositoryImpl(this.fixturesApi, this.fixturesPrefs);

  @override
  Future<Either<Failure, List<Fixture>>> getFixtures(
      {required String season, required String leagueId}) async {
    try {
      if (cachIsValid()) {
        return Right(fixturesPrefs.getFixtures());
      }

      final apiResult =
          await fixturesApi.getFixtures(season: season, leagueId: leagueId);
      fixturesPrefs.setFixtures(apiResult);
      return Right(apiResult);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Lineup>>> getLineups(
      {required String fixtureId}) async {
    try {
      return Right(await fixturesApi.getLineup(fixtureId: fixtureId));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  bool cachIsValid() {
    final result = fixturesPrefs.getLastCachEntryDate();
    return (result != null &&
        ((DateTime.tryParse(result)?.isSameDate(DateTime.now())) ?? false));
  }
}
