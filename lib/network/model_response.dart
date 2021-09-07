abstract class Result<T> { }

class Success<T> extends Result<T> {
  final T value;
  Success(this.value);
}

class Error<T> extends Result<T> {
  final Exception exception;
  Error(this.exception);
}

const String apiUrl =
'https://raw.githubusercontent.com/EvgenyAbdullaev/shared_files/main/coffee/';