import 'package:flutter/material.dart';

import 'package:movie_app/Widgets/CustomImage.dart';

class CustomCard extends StatelessWidget {
  final String _image;
  final String _title;
  final VoidCallback _onTap;
  final String? tagHeroId;

  CustomCard(this._image, this._title, this._onTap,  {this.tagHeroId});

  @override
  Widget build(BuildContext context) {
    final Widget _card = Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 8,
                      offset: Offset(10, 10))
                ]),
            child: Hero(tag: tagHeroId!, child: CustomImage(_image))
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            child: Text(
              _title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );

    return GestureDetector(
      child: _card,
      onTap: _onTap,
    );
  }
}


