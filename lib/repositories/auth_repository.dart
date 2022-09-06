import 'package:flutter_provider_mvvm_state_mgt_two/data/network/base_api_services.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/data/network/network_api_services.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/res/app_url.dart';

class AuthRepository {
  final BaseAPIServices _apiServices = NetworkAPIService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPOSTApiResponse(AppUrl.loginEndPoint, data);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPOSTApiResponse(AppUrl.registerEndPoint, data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
