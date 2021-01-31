import 'package:flutter/material.dart';
import 'package:movie_app/Components/CustomCard.dart';
import '../src/models/movies_model.dart';


class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final Function nextMovies;
  MovieHorizontal({@required this.movies, @required this.nextMovies});

  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextMovies(); 
      }
    });

    return Container(
        height: _screenSize.height * 0.25,
        child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: movies.length,
          itemBuilder: (context, index){
            return Hero(
              tag: movies[index].id,
              child:  CustomCard(
                movies[index].getPosterImage(), 
                movies[index].title,()=> Navigator.pushNamed(context, 'details', arguments: movies[index]),
            )
               
            );
          },
        ));
  }
}
