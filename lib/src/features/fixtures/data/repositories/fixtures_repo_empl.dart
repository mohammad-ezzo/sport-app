import 'package:dartz/dartz.dart';
import 'package:sport_app/src/core/exceptions/exceptions.dart';
import 'package:sport_app/src/core/exceptions/failures.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';
import '../../domain/repositories/fixtures_repository.dart';
import '../data_sources/fixtures_api.dart';
import '../data_sources/fixtures_shared_prefs.dart';

class FixturesRepositoryImpl extends FixturesRepository {
  final FixturesApi fixturesApi;
  final FixturesSharedPrefs fixturesPrefs;
  FixturesRepositoryImpl(this.fixturesApi, this.fixturesPrefs);

  @override
  Future<Either<Failure, List<Fixture>>> getFixtures() async {
    throw UnimplementedError();
    try {
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
