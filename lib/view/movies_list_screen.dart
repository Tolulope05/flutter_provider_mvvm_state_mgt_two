import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/data/response/status.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view_model/movie_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/movies_model.dart';

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
                // print(value.moviesList.data);
                return Center(
                  child:
                      Text(value.moviesList.status_message ?? "Error from TC"),
                );
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data!.data!.movies!.length,
                  itemBuilder: ((context, index) {
                    List<Movie>? movies = value.moviesList.data!.data!.movies!;
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          movies[index].smallCoverImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                        title: Text(movies[index].title!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(movies[index].year!.toString()),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Rating: ${movies[index].rating.toString()}"),
                              ],
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            TextButton(
                                onPressed: () {
                                  _launchURL(movies[index].url!);
                                },
                                child: const Text("Download")),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(movies[index].rating!.toString()),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
