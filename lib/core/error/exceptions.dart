class MissingApiKeyException implements Exception {
  const MissingApiKeyException(this.keyName);

  final String keyName;

  @override
  String toString() => 'MissingApiKeyException: $keyName is not set';
}

class LocationException implements Exception {
  const LocationException(this.message);

  final String message;

  @override
  String toString() => 'LocationException: $message';
}
