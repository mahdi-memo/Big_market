import 'package:flutter/material.dart';
import 'package:me/src/admin/pages/add_food_item.dart';
import 'package:me/src/data/food.dart';
import 'package:me/src/scoped-model/main_model.dart';
import 'package:me/widget/food_item_card.dart';
import 'package:me/widget/show_dailog.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:food_app_flutter_zone/src/admin/pages/add_food_item.dart';
// import 'package:food_app_flutter_zone/src/models/food_model.dart';
// import 'package:food_app_flutter_zone/src/scoped-model/main_model.dart';
// import 'package:food_app_flutter_zone/src/widgets/food_item_card.dart';
// import 'package:food_app_flutter_zone/src/widgets/show_dailog.dart';
// import 'package:scoped_model/scoped_model.dart';

class FavoritePage extends StatefulWidget {
  final MainModel model;

  FavoritePage({this.model});
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  // the scaffold global key
  // GlobalKey<ScaffoldState> _explorePageScaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     widget.model.fetchFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  key: _explorePageScaffoldKey,
      body:  ScopedModelDescendant<MainModel>(
        builder: (BuildContext sctx, Widget child, MainModel model) {
          //model.fetchFood(); // this will fetch and notifylisteners()
           List<Food> foods = model.foods;
          return Container(
           padding: EdgeInsets.symmetric(horizontal: 30.0 ),
                 child: RefreshIndicator(
                   onRefresh: model.fetchFood,
                   child: ListView.builder(
                     itemCount: model.foodSize,
                     itemBuilder: (BuildContext lctx, int index){
                       return   GestureDetector(
                         onTap: (){
                           Navigator.of(context).push(
                             MaterialPageRoute(builder: (BuildContext mctx)=>AddFoodItem(
                               food: model.foods[index],
                             ))
                           );
                         },
                         onDoubleTap: (){
                           showLoadingIndicator(
                                    context,                    
                                         "Deleting food..."
                                        );

                           model.deleteFood(model.foods[index].id).then((bool response){
                             Navigator.of(context).pop();
                           });
                         },
                        child: FoodItemCard(model.foods[index].name,
                       model.foods[index].describtion, 
                       model.foods[index].price.toString())
                       );
                     },
             ),
                 ),
          );
         },
       ),
    );
  }
}

// Container(
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: ScopedModelDescendant<MainModel>(
//           builder: (BuildContext context, Widget child, MainModel model) {
//             model.fetchFoods();
//             List<Food> foods = model.foods;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: foods.map((Food food){
//                 return FoodItemCard(
//                   food.name,
//                   food.description,
//                   food.price.toString(),
//                 );
//               }).toList(),
//             );
//           },
//         ),
//       )
