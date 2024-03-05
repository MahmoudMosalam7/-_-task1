

import 'package:flashcardquizapp/constant.dart';
import 'package:flashcardquizapp/screens/welcome.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello $name',style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
            Text('Your Score is ',style: TextStyle(
                fontSize: 25,
                color: Colors.white,
            ),),
            SizedBox(height: 10,),
            Text('${score}% ',style: TextStyle(
                fontSize:50,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              score = 0;

              Navigator.pushReplacement(context, MaterialPageRoute(builder:
              (context){
                return WelcomeScreen();
              }));
            },
                child: Text('Test Again',
                style:TextStyle(
                    fontSize:25,
                    color: Colors.cyan,
                ) ,
                ),
              style: ElevatedButton.styleFrom(

              ),
            ),
          ],
        ),
      ),
    );
  }
}
