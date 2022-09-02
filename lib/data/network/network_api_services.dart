import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import './../app_exeptions.dart';
import './base_api_services.dart';

class NetworkAPIService extends BaseAPIServices {
  @override
  Future getGETApiResponse(String url) async {
    dynamic responseJson;
    try {
      //on timeout gives it duration to return something else on time out.
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // No internet.
      throw FetchDataException("No Internet Connection");
    } catch (e) {
      // Do something..
    }
    return responseJson;
  }

  @override
  Future getPOSTApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // No internet.
      throw FetchDataException("No Internet Connection");
    } catch (e) {
      // Do something..
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 404:
        throw UnauthorizedException(response.body);
      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code ${response.statusCode}");
    }
  }
}
