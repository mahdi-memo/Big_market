import 'package:flutter/material.dart';

class Inter extends StatelessWidget{

  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  Inter({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(imagePath),
                height: 25.0,
                width: 55.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}