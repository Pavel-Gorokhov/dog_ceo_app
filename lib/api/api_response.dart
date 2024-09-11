/// The default error message. If the error explanation doesn't make sense for a user.
const String oops = 'Oops! Something went wrong :(';

class APIResponse<T> {
  APIResponse({
    this.data,
    this.error,
  });
  T? data;
  APIResponseError? error;
}

class APIResponseError {
  APIResponseError({
    this.message = oops,
    this.code,
  });

  String message;
  String? code;
}
