import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movies_model.dart';

import 'package:movie_app/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  final movieProvider = new MoviesProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: AnimatedIcon(
          progress: transitionAnimation,
          icon: AnimatedIcons.menu_close,
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          progress: transitionAnimation, icon: AnimatedIcons.menu_arrow),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: movieProvider.searchMovie(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data as List<Movie>;
            return ListView(
                children: movies.map((movie) {
              return ListTile(
                  title: Text(movie.title!),
                  subtitle: Text(movie.originalTitle!),
                  leading: FadeInImage(
                      image: NetworkImage(movie.getPosterImage()),
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      width: 40.0,
                      fit: BoxFit.contain),
                  onTap: () {
                    close(context, null);
                    Navigator.pushNamed(context, 'details', arguments: movie);
                  });
            }).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  String get searchFieldLabel => 'Buscar...';
}
