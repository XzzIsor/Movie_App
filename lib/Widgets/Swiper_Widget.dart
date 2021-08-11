import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/Widgets/CustomImage.dart';

import '../src/models/movies_model.dart';

class CustomSwiper extends StatelessWidget {
  CustomSwiper({@required this.items});

  final List<Movie> items;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 0),
      width: double.infinity,
      child: Swiper(
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        itemBuilder: (BuildContext context, int index) {
          items[index].uniqueId = '${items[index].id}-poster';
          return Hero(
            tag: items[index].uniqueId,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: items[index]),
              child: CustomImage(
                items[index].getPosterImage(),
              ),
            ),
          );
        },
        itemCount: items.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
