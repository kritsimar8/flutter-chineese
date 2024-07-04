
import 'package:chineesefood_app/models/food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu=[
    Food(
      name:"Dumplings",
      price:"11.00",
      imagePath:"lib/images/dumplings.png",
      rating:"4.9",
    ),
    Food(
      name:"Garlic Ramen",
      price:"18.00",
      imagePath:"lib/images/ramen.png",
      rating:"4.3",
    ),
    Food(
      name:"Fried rice",
      price:"10.00",
      imagePath:"lib/images/fried-rice.png",
      rating:"4.3",
    ),
    Food(
      name:"Shrimp",
      price:"18.00",
      imagePath:"lib/images/shrimp.png",
      rating:"4.3",
    ),
    Food(
      name:"Egg ramen",
      price:"18.00",
      imagePath:"lib/images/eggramen.png",
      rating:"4.3",
    ),
  ];

  List<Food> _cart=[];
  List<Food> get foodMenu=> _foodMenu;
  List<Food>get cart => _cart;

  void addToCart(Food foodItem, int quantity){
    for(int i=0; i<quantity;i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}