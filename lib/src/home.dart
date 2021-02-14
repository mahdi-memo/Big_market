import 'package:flutter/material.dart';
import 'package:me/src/page/food_details_page.dart';
import 'package:me/src/scoped-model/main_model.dart';
import 'package:me/widget/bought_foods.dart';
import 'package:me/widget/food_category.dart';
import 'package:me/widget/home_top_info.dart';
import 'package:me/widget/inter.dart';
import 'package:me/widget/search_file.dart';
import 'package:scoped_model/scoped_model.dart';
import 'data/food.dart';
class HomeScreen extends StatefulWidget{
  // final FoodModel foodModel;
  // HomeScreen(this.foodModel);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  @override
  void initState(){
    // widget.foodModel.fetchFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body:Container(
       height: 2000.0,
       child: ListView(
           padding: EdgeInsets.only( left: 10.0 , right: 20.0),
           children: <Widget>[
            HomeTopInfo(),
            FoodCategory(),
            SizedBox(height: 20.0,),
            SizedBox(height: 20.0,),
            SearchField(),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Frequantly sell",
                  style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold ),
                ),
                 GestureDetector(
                   onTap: (){},
                   child: Text(
                     "View all",
                    style: TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.bold ,
                    color: Colors.orange),
                ),
                 ),

              ],
            ),
            SizedBox(height: 20.0,),
             ScopedModelDescendant<MainModel>(
               builder: (BuildContext context, Widget child , MainModel model)
              {
              return Column(
              children: model.foods.map(_bout).toList(),
                   );
               },
             ),
          
           ],
         ),
     ),
     );
    
  }
   Widget _bout(Food food){
       return GestureDetector(
         onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FoodDetailsPage(
             food: food,
           )));
         },
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BoughtFood(
                id: food.id,
                name: food.name,
                imagePath: "assets/cap_1.png",
                category: food.category,
                price: food.price,
                discount: food.discount,
                ratings: food.ratings,
           ) ,
         ),
       );
     }

}