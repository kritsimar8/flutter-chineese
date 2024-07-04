import 'package:chineesefood_app/components/button.dart';
import 'package:chineesefood_app/main.dart';
import 'package:chineesefood_app/models/food.dart';
import 'package:chineesefood_app/models/shop.dart';
import 'package:chineesefood_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget{
  final Food food;
  const FoodDetailsPage({super.key,required this.food});

  @override
  State<FoodDetailsPage> createState()=> _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage>{

  int quantityCount=0;

  void decrementQuantity(){
    setState((){
      if(quantityCount>0){
         quantityCount--;
      }
     
    });
  }

  void incrementQuantity(){
    setState((){
      setState((){
        quantityCount++;
      });
    });
  }

  void addToCart(){
    if(quantityCount>0){
      final shop=context.read<Shop>();

      shop.addToCart(widget.food,quantityCount);
      
      showDialog(
        context:context,
        barrierDismissible:false,
        builder:(context)=> AlertDialog(
          backgroundColor:primaryColor,
          content:Text("Successfully added to cart",
            style:TextStyle(color:Colors.white),
            textAlign:TextAlign.center,
          ),
          actions:[
            IconButton(
              onPressed:(){
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon:const Icon(
                Icons.done,
                color:Colors.white,
                ),
            )
          ]
        ),
      );
    
    }
  }




  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.transparent,
        elevation:0,
        foregroundColor:Colors.grey[900],
      ),
      body:Column(
        children:[
          Expanded(
           child:Padding(
            padding:const EdgeInsets.symmetric(horizontal:25.0),
             child:ListView(
              children:[
                Image.asset(
                  widget.food.imagePath,
                  height:200,
                ),
                const SizedBox(height:25),

                Row(
                  children:[
                    Icon(Icons.star,color:Colors.yellow[800],),

                    const SizedBox(height:5),
                    Text(
                      widget.food.rating,
                      style:TextStyle(
                        color:Colors.grey[600],
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                  ]
                ),
                const SizedBox(height:10),
                Text(
                  widget.food.name,
                  style:GoogleFonts.dmSerifDisplay(fontSize:28),
                ),
                const SizedBox(height:25),
                Text(
                  "Description",
                  style:TextStyle(
                    color:Colors.grey[900],
                    fontWeight:FontWeight.bold,
                    fontSize:18,
                  )
                ),
                const SizedBox(height:10),
                Text(
                  "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillowof perfectly seasoned sushi rice . Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wassabi and side traditional pickled ginger,our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                  style:TextStyle(
                    color:Colors.grey[600],
                    fontSize:14,
                    height:3
                  )
                )
              ]
            )
           )
          ),
          Container(
            decoration:BoxDecoration(color:primaryColor,borderRadius:BorderRadius.only(
              topLeft:Radius.circular(50.0),
              topRight:Radius.circular(50.0),
            )),
           
            padding:const EdgeInsets.all(25),
            child:Column(
              children:[
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text("\$${widget.food.price}",
                     style:const TextStyle(
                      color:Colors.white,
                     fontWeight:FontWeight.bold,
                     fontSize:18,
                     )
                     ),
                     Row(
                      children:[
                        Container(
                          decoration:BoxDecoration(
                            color:secondaryColor,
                            shape:BoxShape.circle,
                            ),
                           child:IconButton(
                            icon:const Icon(Icons.remove,color:Colors.white),
                            onPressed: decrementQuantity,
                           ),
                        ),

                        SizedBox(
                        width:40,
                        child:Center(
                        child: Text(
                            quantityCount.toString(),
                            style:const TextStyle(
                              color:Colors.white,
                              fontWeight:FontWeight.bold,
                              fontSize:18,
                            ),
                          ),
                        ),
                        ),



                        Container(
                          decoration:BoxDecoration(
                            color:secondaryColor,
                            shape:BoxShape.circle,
                            ),
                           child:IconButton(
                            icon:Icon(Icons.add,color:Colors.white),
                            onPressed: incrementQuantity,
                           ),
                        ),
                       
                      ]
                     )
                  ]
                ),
                  const SizedBox(height:25),

                MyButton(text:"Add to Cart",onTap:addToCart)
              ]
            )
          ),
        ]
      )
    );
  }
}