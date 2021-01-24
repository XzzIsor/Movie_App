import 'package:flutter/material.dart';

import 'package:movie_app/Components/Swiper_Widget.dart';

import 'package:movie_app/Components/Movie_Horizontal.dart';

import '../providers/movies_provider.dart';

class HomePage extends StatelessWidget {
  final movies = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Películas En Cartelera"),
        backgroundColor: Colors.black,
        centerTitle: false,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
          color: Colors.deepPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _createSwiper(), 
              
              _popularMovies(context)
            ],
          )),
    );
  }

  Widget _createSwiper() {
    return FutureBuilder(
      future: movies.getInCines(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? CustomSwiper(items: snapshot.data)
            : Container(child: CircularProgressIndicator());
      },
    );
  }

  Widget _popularMovies(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text('Populares', style: Theme.of(context).textTheme.headline6,)),
          SizedBox(height: 10,),
          _getPopularMovies(),
        ],
      )
    );
  }

  Widget _getPopularMovies(){
    return FutureBuilder(
      future: movies.getPopular(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? MovieHorizontal( movies: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

}












