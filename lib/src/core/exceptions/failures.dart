// General Failure class 
abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

// Server failures 
class ServerFailure extends Failure {
  ServerFailure(String errorMessage) : super(errorMessage);
}

// Cache failures
class CacheFailure extends Failure {
  CacheFailure(String errorMessage) : super(errorMessage);
}

// Fake failures for testing
class FakeFailure extends Failure {
  FakeFailure(String message) : super(message);
}
