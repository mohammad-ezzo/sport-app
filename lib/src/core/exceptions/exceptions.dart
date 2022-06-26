//For handling all server exceptions then convert them into Failures
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class CacheException implements Exception {}
