import 'package:dartz/dartz.dart';
import 'package:sport_app/src/core/exceptions/failures.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';

abstract class FixturesRepository {
  Future<Either<Failure, List<Fixture>>> getFixtures();
}
