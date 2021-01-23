import 'package:flutter/material.dart';

import 'package:movie_app/Components/Swiper_Widget.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arriba andorra y uan es gei"),
        backgroundColor: Colors.black,
        centerTitle: false,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
          color: Colors.deepPurple,
          child: Column(
            children: [
              CustomSwiper(
                items: [5,4,54,],
              ),
            ],
          )),
    );
  }
}
