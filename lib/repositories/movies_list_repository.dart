import 'package:flutter_provider_mvvm_state_mgt_two/data/network/base_api_services.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/data/network/network_api_services.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/res/app_url.dart';

import '../model/movies_model.dart';

class MovieRepository {
  final BaseAPIServices _apiServices = NetworkAPIService();
  Future<MovieList> getMovies() async {
    /// Fetch movie list
    try {
      dynamic response = await _apiServices
          .getGETApiResponse(AppUrl.moviebaseUrl + AppUrl.getMovieList);

      MovieList movieList = MovieList.fromJson(response);
      print(movieList);
      print("success");
      return movieList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
