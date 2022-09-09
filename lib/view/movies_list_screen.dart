import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/data/response/status.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view_model/movie_list_view_model.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  MovieListViewModel movieListViewModel = MovieListViewModel();
  @override
  void initState() {
    super.initState();
    movieListViewModel.fetchMoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MovieListViewModel>(
        create: (context) => movieListViewModel,
        child: Consumer<MovieListViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                print(value.moviesList.data);
                return Center(
                  child:
                      Text(value.moviesList.status_message ?? "Error from TC"),
                );
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.data!.movies!.length,
                    itemBuilder: ((context, index) {
                      return const Card(
                        child: Text("Tolulope"),
                      );
                    }));
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
