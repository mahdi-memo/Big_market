 import 'package:flutter/material.dart';
// import 'package:food_app_flutter_zone/src/models/food_model.dart';
// import 'package:food_app_flutter_zone/src/scoped-model/main_model.dart';
// import 'package:food_app_flutter_zone/src/widgets/button.dart';
// import 'package:food_app_flutter_zone/src/widgets/show_dailog.dart';
// import 'package:scoped_model/scoped_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:me/src/data/food.dart';
import 'package:me/src/scoped-model/main_model.dart';
import 'package:me/widget/button.dart';
import 'package:me/widget/show_dailog.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  final Food food;

  AddFoodItem({this.food});

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String title;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: WillPopScope(
             onWillPop: () {
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
                      child: Scaffold(
         key: _scaffoldStateKey,
         appBar: AppBar(
             elevation: 0.0,
             backgroundColor: Colors.white,
             centerTitle: true,
             leading: IconButton(
               icon: Icon(Icons.close,color:Colors.black),
               onPressed: (){
                 Navigator.of(context).pop(false);
               },
             ),
             title: Text(widget.food!=null ? "Updating food item " : "Add food item" ,style: TextStyle(fontSize: 20.0, fontWeight:FontWeight.bold,color: Colors.black,)),
         ),
         
        body: SingleChildScrollView(
            
                 child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.0 , horizontal: 10.0),
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child:Form(
              key: _foodItemFormKey,
              child: Column(
              children: <Widget>
              [
                 Container(
                          margin: EdgeInsets.only(bottom: 15.0),
                          width: MediaQuery.of(context).size.width,
                          height: 170.0,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage("assets/noimage.png"),
                            ),
                          ),
                        ),
                          _buld("Food Title"),
                          _buld("Category"),
                          _buld("Description", max: 5),
                          _buld("Price"),
                          _buld("Discount"),
                  SizedBox(
                          height: 70.0,
                        ),
                        ScopedModelDescendant(
                           builder: (BuildContext context, Widget child,
                               MainModel model) {
                               return GestureDetector(
                                 //buttom action
                      onTap:() {
                      onSubmit(model.addFood, model.updateFood);
                       if(model.isLoading){
                          showLoadingIndicator(
                                    context,
                                    widget.food != null
                                        ? "Updating food..."
                                        : "Adding food...");

                       }
                      },
                      child: Button(
                                btnText: widget.food != null
                                    ? "Update Food Item"
                                    : "Add Food Item"),
                      );
                               }
                            
                    ),
                 
              ],
            ),
            ),
        ),
      ),
      ),
          ),
    );
//     return SafeArea(
//       child: WillPopScope(
//         onWillPop: () {
//           Navigator.of(context).pop(false);
//           return Future.value(false);
//         },
//         child: Scaffold(
//           key: _scaffoldStateKey,
//           appBar: AppBar(
//             elevation: 0.0,
//             backgroundColor: Colors.white,
//             title: Text(
//               widget.food != null ? "Update Food Item" : "Add Food Item",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold),
//             ),
//             centerTitle: true,
//             leading: IconButton(
//               icon: Icon(
//                 Icons.close,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               // width: MediaQuery.of(context).size.width,
//               // height: MediaQuery.of(context).size.height,
//               child: Form(
//                 key: _foodItemFormKey,
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(bottom: 15.0),
//                       width: MediaQuery.of(context).size.width,
//                       height: 170.0,
//                       decoration: BoxDecoration(
//                         // color: Colors.red,
//                         borderRadius: BorderRadius.circular(10.0),
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/noimage.png"),
//                         ),
//                       ),
//                     ),
//                     _buildTextFormField("Food Title"),
//                     _buildTextFormField("Category"),
//                     _buildTextFormField("Description", maxLine: 5),
//                     _buildTextFormField("Price"),
//                     _buildTextFormField("Discount"),
//                     SizedBox(
//                       height: 70.0,
//                     ),
//                     ScopedModelDescendant(
//                       builder: (BuildContext context, Widget child,
//                           MainModel model) {
//                         return GestureDetector(
//                           onTap: () {
//                             onSubmit(model.addFood, model.updateFood);
//                             if (model.isLoading) {
//                               // show loading progess indicator
//                               showLoadingIndicator(
//                                   context,
//                                   widget.food != null
//                                       ? "Updating food..."
//                                       : "Adding food...");
//                             }
//                           },
//                           child: Button(
//                               btnText: widget.food != null
//                                   ? "Update Food Item"
//                                   : "Add Food Item"),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
  }
//000000000000000000000
Widget _buld(String hint,{int max = 1}){
  return TextFormField(
              initialValue: widget.food != null && hint == "Food Title"
              ? widget.food.name
              : widget.food != null && hint == "Description"
                  ? widget.food.describtion
                  : widget.food != null && hint == "Category"
                      ? widget.food.category
                      : widget.food != null && hint == "Price"
                          ? widget.food.price.toString()
                          : widget.food != null && hint == "Discount"
                              ? widget.food.discount.toString()
                              : "",
                decoration: InputDecoration(
                hintText: " $hint",    
              ),
                maxLines: max,
                keyboardType: hint == "Price" || hint == "Discount"
                ? TextInputType.number
                : TextInputType.text,
        validator: (String value){
          
         if (value.isEmpty && hint == "Food Title") {
           return "The food title is required";
         }
         if (value.isEmpty && hint == "Description") {
           return "The description is required";
         }

         if (value.isEmpty && hint == "Category") {
           return "The category is required";
         }

         if (value.isEmpty && hint == "Price") {
           return "The price is required";
         }
        
       },
                onChanged: (String  value){
                  if(hint == "Food Title")
                  {title=value;}
                  if(hint == "Category")
                  {category=value;}
                  if(hint == "Description")
                  {description=value;}
                  if(hint == "Price")
                  {price=value;}
                  if(hint == "Discount")
                  {discount=value;}
                  

                },
  );
}
      void onSubmit(Function addFood, Function updateFood) async {
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();

      if (widget.food != null) {
        // I want to update the food item
        Map<String, dynamic> updatedFoodItem = {
          "name": title,
          "category": category,
          "describtion": description,
          "price": double.parse(price),
          "discount": discount != null ? double.parse(discount) : 0.0,
        };

        final bool response = await updateFood(updatedFoodItem, widget.food.id);
        if (response) {
          Navigator.of(context).pop(); // to remove the alert Dialog
          Navigator.of(context).pop(response); // to the previous page
        } else if (!response) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text(
              "Failed to update food item",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      } else if (widget.food == null) {
        // I wnat to add new Item
        final Food food = Food(
          name: title,
          category: category,
          describtion: description,
          price: double.parse(price),
          discount: double.parse(discount),
        );
        bool value = await addFood(food);
        if (value) {
          Navigator.of(context).pop();
          SnackBar snackBar =
              SnackBar(content: Text("Food item successfully added."));
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!value) {
          Navigator.of(context).pop();
          SnackBar snackBar =
              SnackBar(content: Text("Failed to add food item"));
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
    Widget _buildCategoryTextFormField() {
    return TextFormField();
  }
  }

        //  void onSubmit(Function addFood , Function updateFood) async{
        //   if(_foodItemFormKey.currentState.validate()){
        //      _foodItemFormKey.currentState.save();
        //      if(widget.food != null){
        //       // I want to update the food item
        //         Map<String, dynamic> updatedFoodItem = {
        //           "name": title,
        //           "category": category,
        //           "describtion": description,
        //           "price": double.parse(price),
        //           "discount": discount != null ? double.parse(discount) : 0.0,
        //           "foodId" :widget.food.id,
        //         };

        //             final bool response = await updateFood(updatedFoodItem, widget.food.id);
        //             if (response) {
        //               Navigator.of(context).pop(); // to remove the alert Dialog
        //               Navigator.of(context).pop(response); // to the previous page
        //             } else if (!response) {
        //               Navigator.of(context).pop();
        //               SnackBar snackBar = SnackBar(
        //                 duration: Duration(seconds: 2),
        //                 backgroundColor: Colors.red,
        //                 content: Text(
        //                   "Failed to update food item",
        //                   style: TextStyle(color: Colors.white, fontSize: 16.0),
        //                 ),
        //               );
        //   _scaffoldStateKey.currentState.showSnackBar(snackBar);
        // }


        //      }else if(widget.food == null){
        //        //add food
        //         final Food food =Food(
        //                 name: title,
        //                 category: category,
        //                 describtion: description,
        //                 price: double.parse(price),
        //                 discount: double.parse(price)
        //               );
        //         bool value =await addFood(food);
        //         if(value){
        //           Navigator.of(context).pop();
        //           SnackBar snackBar = SnackBar(
        //             content: Text("Food item successfully added."),
        //           );
        //           _scaffoldStateKey.currentState.showSnackBar(snackBar);
        //         } if(!value){
        //            Navigator.of(context).pop();
        //           SnackBar snackBar = SnackBar(
        //             content: Text("Failed to add food item"),
        //           );
        //           _scaffoldStateKey.currentState.showSnackBar(snackBar);
        //         }

        //      }
                     
        //       }
                    
        //       }
}
 
  

//   Widget _buildTextFormField(String hint, {int maxLine = 1}) {
//     return TextFormField(
//       initialValue: widget.food != null && hint == "Food Title"
//           ? widget.food.name
//           : widget.food != null && hint == "Description"
//               ? widget.food.description
//               : widget.food != null && hint == "Category"
//                   ? widget.food.category
//                   : widget.food != null && hint == "Price"
//                       ? widget.food.price.toString()
//                       : widget.food != null && hint == "Discount"
//                           ? widget.food.discount.toString()
//                           : "",
//       decoration: InputDecoration(hintText: "$hint"),
//       maxLines: maxLine,
//       keyboardType: hint == "Price" || hint == "Discount"
//           ? TextInputType.number
//           : TextInputType.text,
//       validator: (String value) {
//         // String error
//         if (value.isEmpty && hint == "Food Title") {
//           return "The food title is required";
//         }
//         if (value.isEmpty && hint == "Description") {
//           return "The description is required";
//         }

//         if (value.isEmpty && hint == "Category") {
//           return "The category is required";
//         }

//         if (value.isEmpty && hint == "Price") {
//           return "The price is required";
//         }
//         // return "";
//       },
//       onSaved: (String value) {
//         if (hint == "Food Title") {
//           title = value;
//         }
//         if (hint == "Category") {
//           category = value;
//         }
//         if (hint == "Description") {
//           description = value;
//         }
//         if (hint == "Price") {
//           price = value;
//         }
//         if (hint == "Discount") {
//           discount = value;
//         }
//       },
//     );
  // }

  
// }
