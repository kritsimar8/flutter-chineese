import 'package:chineesefood_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 138, 56, 55),
      body:Padding(
        padding:const EdgeInsets.all(25.0),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children:[
            const SizedBox(height:25),

            Text("CHINA TOWN",
            style:GoogleFonts.dmSerifDisplay(
              fontSize:28,
              color:Colors.white,
            ),
            ),
            const SizedBox(height:25),

           Padding(
            padding:const EdgeInsets.all(60.0),
            child: Image.asset('lib/images/noodles.png')
           ),
           const SizedBox(height:25),

          Text("THE TASTE OF CHINEESE FOOD",
            style:GoogleFonts.dmSerifDisplay(
              fontSize:28,
              color:Colors.white,)
          ),
            const SizedBox(height:10),
            Text("Feel the taste of the most popular Chineese food available in the market",
            style:TextStyle(color:Colors.grey[400],
              height:2,
            )
            ),
            const SizedBox(height:25),
            MyButton(
              text:"GetStarted",
              onTap:(){
                 Navigator.pushNamed(context,'/menupage');
              }
            )
          ]
        )
      )
    );
  }
}