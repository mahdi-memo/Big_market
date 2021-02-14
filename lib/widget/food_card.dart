import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget{

  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  FoodCard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      height: 105.0,
       width: 200.0,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(imagePath),
                height: 55.0,
                width: 55.0,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(categoryName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),),
                   SizedBox(width: 10.0,),
                  Text(numberOfItems.toString()+" Kind", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}