import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:movie_app/Widgets/Sliders/Cast_horizontal.dart';
import 'package:movie_app/src/models/movies_model.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie _movie = ModalRoute.of(context)!.settings.arguments as Movie; 
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
            tag: movie.uniqueIdBanner!,
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
                FadeIn(child: Text(movie.title!, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline6), delay: Duration(milliseconds: 300),),
                FadeIn(child: Text(movie.originalTitle!, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle1), delay: Duration(milliseconds: 300),),
                FadeIn(
                  child: Row(
                    children:[
                      Icon(Icons.star),
                      Text(movie.voteAverage.toString())
                    ]
                  ),
                  delay: Duration(milliseconds: 300),
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
      child: FadeIn(child: Text(movie.overview!, textAlign: TextAlign.justify), delay: Duration(milliseconds: 300),),
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
        title:FadeIn(child: Text(movie.title!, textAlign: TextAlign.center,), delay: Duration(milliseconds: 300),), 
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
