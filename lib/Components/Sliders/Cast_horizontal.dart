import 'package:flutter/material.dart';
import 'package:movie_app/Components/CustomCard.dart';
import 'package:movie_app/src/models/actors_model.dart';
import 'package:movie_app/src/providers/movies_provider.dart';

class CastHorizontal extends StatelessWidget {
  final actors = new MoviesProvider();

  final List<Actor> cast = new List();
  final String movieId;
  CastHorizontal({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: _createCasting(),
    );
  }

  Widget _createCasting() {
    return FutureBuilder(
      future: actors.getCast(movieId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        final List<Widget> listActorsCards = snapshot.data
            .map<Widget>(
                (actor) => CustomCard(actor.getActorPhoto(), actor.name, () {}))
            .toList();

        return PageView(
          children: listActorsCards,
          pageSnapping: true,
          controller: PageController(
            initialPage: 1,
            viewportFraction: 0.3,
          ),
        );
      },
    );
  }
}





