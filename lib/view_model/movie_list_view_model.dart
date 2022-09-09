import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/data/response/api_response.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/repositories/movies_list_repository.dart';

import '../model/movies_model.dart';

class MovieListViewModel with ChangeNotifier {
  final _myMovieRepo = MovieRepository();

  ApiResponse<MovieList> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieList> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    _myMovieRepo.getMovies().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
