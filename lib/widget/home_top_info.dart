import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final texttest = TextStyle(fontSize: 32.0 , fontWeight:FontWeight.bold);
 
     return Container(
    margin: EdgeInsets.only(bottom:20.0),
      child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("What would " ,style:texttest),
                   Text("you like to Buy?",style:texttest,)
                 ],

               ),
                  ],
           ),
     );
  }
}