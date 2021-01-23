import 'package:flutter/material.dart';
import '../src/models/movies_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  MovieHorizontal({ @required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
        height: _screenSize.height * 0.2,
        child: PageView(
          pageSnapping: false,
          controller: PageController(
            initialPage: 1,
            viewportFraction: 0.3,
          ),
          children: _cards(),
        ));
  }

  List<Widget> _cards() => movies.map((movie)=> Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/img/no-image.jpg"), 
            image: NetworkImage(movie.getPosterImage()),
            fit: BoxFit.cover,
            height: 152,
          )
        ],
      ),
    )
    
    ).toList();
  }

