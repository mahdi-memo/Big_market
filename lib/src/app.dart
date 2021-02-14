import 'package:flutter/material.dart';
import 'package:me/src/scoped-model/main_model.dart';
import 'package:me/src/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
final MainModel mainModel = MainModel();
  @override
  Widget build(BuildContext context) {
    return  ScopedModel<MainModel>(model: mainModel, 
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Big Sell",
        theme: ThemeData(primaryColor: Colors.blueAccent),
         home: MainScreen(model: mainModel),
        //home: AddFoodItem(),

    ));
  }
}
