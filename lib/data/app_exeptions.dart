// ignore: slash_for_doc_comments
/**
 * Handle App Exceptions.
 * - This handles all error in the app
 * - Most error scenarios in the app ha been highlighted.
 */

class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions(
    this._message,
    this._prefix,
  );

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error during communicationn");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, "Unauthorised Request");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}
