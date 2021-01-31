import 'package:flutter/material.dart';
import 'package:movie_app/Components/Sliders/Cast_horizontal.dart';
import 'package:movie_app/src/models/movies_model.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie _movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
        slivers: [
        _createSliverAppBar(_movie),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 20.0),
              _posterTitleInfo(context, _movie),
              _description(_movie),
              SizedBox(height: 20.0),
            
              CastHorizontal(movieId: _movie.id.toString()), 
            ]
          )
        )
      ],
    ));
  }

  Widget _posterTitleInfo(BuildContext context, Movie movie ){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(movie.getPosterImage()),
                height: 160.0,
              )
            ),
          ),
          SizedBox(width: 20.0,),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline6),
                Text(movie.originalTitle, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle1),
                Row(
                  children:[
                    Icon(Icons.star),
                    Text(movie.voteAverage.toString())
                  ]
                )
              ]
            )
          ),
        ]
      ),
    );
  }

  Widget _description(Movie movie ){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(movie.overview, textAlign: TextAlign.justify),
    );
  }

  

  Widget _createSliverAppBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.deepPurple,
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      flexibleSpace:FlexibleSpaceBar(
        title:Text(movie.title), 
        titlePadding: EdgeInsetsDirectional.only(start: 16,  end: 16, bottom: 16),
        background: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage(movie.getBackGroundImage()),
          placeholder: AssetImage("assets/img/loading.gif"),
          fadeInDuration: Duration(milliseconds: 500),
        ),
      )
    );       
  }
}
