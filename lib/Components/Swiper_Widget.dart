import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import '../src/models/movies_model.dart';

class CustomSwiper extends StatelessWidget {
  CustomSwiper({@required this.items});

  final List<Movie> items;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Swiper(
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: FadeInImage(
              image: NetworkImage(items[index].getPosterImage()),
              placeholder: AssetImage('assets/img/loading.gif'),
              fit: BoxFit.cover,  
            )
          );
        },
        itemCount: items.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
