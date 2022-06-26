import 'package:dartz/dartz.dart';
import 'package:sport_app/src/core/exceptions/failures.dart';

abstract class FixturesRepository {
  Future<Either<Failure, bool>> getFixtures();
}
