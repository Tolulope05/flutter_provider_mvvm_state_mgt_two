import 'package:flutter_provider_mvvm_state_mgt_two/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? status_message;

  ApiResponse(this.status, this.data, this.status_message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.status_message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $status_message \n Data: $data";
  }
}
