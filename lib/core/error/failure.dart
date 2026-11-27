class Failure {
  final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure([super.message = 'No internet connection.']);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'Something went wrong on the server.']);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure([super.message = 'Unauthorized.']);
}

class NotFoundFailure extends Failure {
  NotFoundFailure([super.message = 'Not found.']);
}

class LocationFailure extends Failure {
  LocationFailure([super.message = 'Could not get your location.']);
}
