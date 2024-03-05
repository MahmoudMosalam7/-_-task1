import 'package:flutter/material.dart';

String name = '';
int score = 0;
Widget buttonWidget({required String text , required VoidCallback onClicked}){
  return ElevatedButton(onPressed: onClicked, child: Text(text,style:TextStyle(
    fontSize: 20,
    color: Colors.white
  ) ,),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 20)
    ),
  );
}