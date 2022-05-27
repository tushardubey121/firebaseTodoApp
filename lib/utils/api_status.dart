class ApiResponse<T> {
  late T data;
  late bool success;
  late String error;

  ApiResponse.success(T response) {
    data = response;
    success = true;
    error = '';
  }

  ApiResponse.error(String errorMessage) {
    error = errorMessage;
    success = false;
  }
}