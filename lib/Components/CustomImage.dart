import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String _image;
  CustomImage(this._image);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage("assets/img/no-image.jpg"),
              image: NetworkImage(_image),
              fit: BoxFit.cover,
              height: 120,
      ),
    );
  }
}