
import 'package:flutter_application_1/core/exception_model.dart';

class ServerException implements Exception {
  final ErrorModel error;

  ServerException(this.error);
}

