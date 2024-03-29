import 'package:flutter/material.dart';

import 'package:movie_app/Widgets/Swiper_Widget.dart';
import 'package:movie_app/Widgets/Sliders/Movie_Horizontal.dart';
import 'package:movie_app/src/search/search_dalegate.dart';

import '../providers/movies_provider.dart';

class HomePage extends StatelessWidget {
  final movies = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    movies.getPopular();

    return Scaffold(
      appBar: AppBar(
        title: Text("Películas En Cartelera"),
        backgroundColor: Colors.black,
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch(), query: "");
              })
        ],
      ),
      body: Container(
          color: Colors.deepPurple,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 80),
                _createSwiper(),
                SizedBox(height: 100,),
                _popularMovies(context),
                SizedBox(height: 100,),
              ],
            ),
          )),
    );
  }

  Widget _createSwiper() {
    return FutureBuilder(
      future: movies.getInCines(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(child: CustomSwiper(items: snapshot.data))
            : Center(child: CircularProgressIndicator());
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
                child: Text(
                  'Populares',
                  style: Theme.of(context).textTheme.headline6,
                )),
            SizedBox(
              height: 30,
            ),
            _getPopularMovies(),
          ],
        ));
  }

  Widget _getPopularMovies() {
    return StreamBuilder(
      stream: movies.popularStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? MovieHorizontal(
                movies: snapshot.data, nextMovies: movies.getPopular)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
