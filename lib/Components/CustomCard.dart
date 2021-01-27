import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String _image;
  final String _title;
  final Function _onTap;

  CustomCard(this._image, this._title, this._onTap);

  @override
  Widget build(BuildContext context) {
    final Widget _card = Container(
        
        margin: EdgeInsets.only(right: 15),
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
                  offset: Offset(10,10) )
              ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage("assets/img/no-image.jpg"),
                  image: NetworkImage(_image),
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _title,
              overflow: TextOverflow.ellipsis,
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
