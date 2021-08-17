import 'package:flutter/material.dart';

import 'package:movie_app/Widgets/CustomImage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../src/models/movies_model.dart';

class CustomSwiper extends StatelessWidget {
  // items[index].uniqueId = '${items[index].id}-poster';
  //child: CustomImage(
  //             items[index].getPosterImage(),
  //           ),

  CustomSwiper({required this.items});
  final List<Movie> items;

  @override
  Widget build(BuildContext context) {

    return CarouselSlider.builder(
        itemCount: items.length, 
        itemBuilder: (context, index, realIndex) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details', arguments: items[index]),
          child: CustomImage(items[index].getBackGroundImage(), )
        ),

        options: CarouselOptions(aspectRatio: 2.0, autoPlay: true, enlargeCenterPage: true)
    );
  }
}
