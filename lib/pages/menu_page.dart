import 'package:chineesefood_app/components/button.dart';
import 'package:chineesefood_app/components/food_tile.dart';
import 'package:chineesefood_app/models/food.dart';
import 'package:chineesefood_app/models/shop.dart';
import 'package:chineesefood_app/pages/food_details_pages.dart';
import 'package:chineesefood_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override 
  State<MenuPage> createState()=> _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  List foodMenu=[
    Food(name: "Dumplings", price:"20.00" , imagePath: "lib/images/dumplings.png", rating: "4.8"),
    Food(name: "Garlic Ramen", price:"25.00" , imagePath: "lib/images/ramen.png", rating: "4.9"),
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

  void navigateToFoodDetails(int index){

    final shop=context.read<Shop>();
    final foodMenu=shop.foodMenu;

    Navigator.push(context,MaterialPageRoute(
      builder:(context)=>FoodDetailsPage(
        food:foodMenu[index],
      ),));
  }


  @override 
  Widget build(BuildContext context){

    final shop = context.read<Shop>();
    final foodmenu=shop.foodMenu;


    return Scaffold(
      backgroundColor:Colors.grey[300],
      appBar:AppBar(
        backgroundColor:Colors.transparent,
        foregroundColor:Colors.grey[800],
        elevation:0,
        leading:const Icon(
          Icons.menu,
        ),
        title:Padding(
          padding:const EdgeInsets.only(right:30.0),
          child:const Center(
         child: Text(
          'Chineese Delicacies',
          style: TextStyle(color:Color.fromARGB(255, 82, 41, 41),)
         
        ),
        ),
        ),
        actions:[
          IconButton(
            onPressed:(){
              Navigator.pushNamed(context,'/cartpage');
            },
            icon:const Icon(Icons.shopping_cart),
          )
        ]
      ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        
        children:[
          Container(
              decoration:BoxDecoration(color:primaryColor,borderRadius:BorderRadius.circular(20)),
              margin:const EdgeInsets.symmetric(horizontal:25,vertical:40),
              padding:const EdgeInsets.symmetric(vertical:25,horizontal:40),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text('Get 32% Promo',style:GoogleFonts.dmSerifDisplay(
                      fontSize:20,
                      color:Colors.white,
                    )),
                    const SizedBox(height:20),

                MyButton(text: "Redeem", onTap: (){},),
                  ]
                ),
                Image.asset('lib/images/noodles.png',height:100)
              ]
            ),
          ),
          const SizedBox(height:5),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: TextField(
            decoration:InputDecoration(
            focusedBorder:OutlineInputBorder(
              borderSide:BorderSide(color:Colors.white),
              borderRadius:BorderRadius.circular(20),
            ),
            enabledBorder:OutlineInputBorder(
              borderSide:BorderSide(color:Colors.white),
              borderRadius:BorderRadius.circular(20),
            ),
            hintText:"Search here..",

          ))
         ),
         const SizedBox(height:25),
         
          Padding(
            padding:const EdgeInsets.symmetric(horizontal:25.0,vertical:25.0),
            child:Text(
              "Food Menu",
              style:TextStyle(
                fontWeight:FontWeight.bold,
                color:Colors.grey[800],
                fontSize:18,
              ),
            ),
          ),
          const SizedBox(height:10),

          Expanded(
            child:Center(
               child:ListView.builder(
              scrollDirection:Axis.horizontal,
              itemCount:foodMenu.length,
              itemBuilder:(context,index)=>FoodTile(
                food:foodMenu[index],
                onTap:()=> navigateToFoodDetails(index),
              ),
            ),
            )
             
          ),
          const SizedBox(height:25),
          Container(
            decoration:BoxDecoration(
              color:Colors.grey[100],
              borderRadius:BorderRadius.circular(20),
            ),
            margin:const EdgeInsets.only(left:25,right:25,bottom:25),
           padding:const EdgeInsets.all(30),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
               Row(children: [
                 Image.asset('lib/images/noodles.png',height:60),
                const SizedBox(width:20),
                Column(
                  children:[
                    
                    Text(
                      "Special Ramen",
                      style:GoogleFonts.dmSerifDisplay(fontSize:18),
                    ),
                    const SizedBox(height:10),

                    Text(
                      '\$21.00',
                      style:TextStyle(color:Colors.grey[700]),
                    ),
                  ],
                )
               ],),
               const Icon(
               Icons.favorite_outline,
               color:Colors.grey,
               size:28,
               )
              ]
            )
          ),
          

        ]
      )
    );
  }
}