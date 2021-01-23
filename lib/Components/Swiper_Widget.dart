import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class CustomSwiper extends StatelessWidget {
  CustomSwiper({@required this.items});

  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Swiper(
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: items.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
