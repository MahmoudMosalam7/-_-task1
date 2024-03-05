import 'package:flashcardquizapp/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class WelcomeScreen extends StatefulWidget {


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameContoller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.cyan,
      body:  ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3.0,
            child: const Column(
              children: [
                SizedBox(height: 80.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Wlecome To FlashCard Quiz',
                      style:TextStyle(
                        fontWeight: FontWeight.bold ,
                        fontSize: 25.0,
                        color: Colors.white,
                      ) ,),


                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Please Enter your Name',
                      style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ) ,),


                  ],
                ),

              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(65.0,),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40.0,),
                      // text field for phone number
                      TextFormField(
                        controller: _nameContoller,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            fontSize: 25.0,

                          ),
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),

                          ),
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                           color: Colors.black,
                        ),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'name is required';
                          }
                          return null;
                        },
                      )
,
                      const SizedBox(height: 20.0,),
                      const SizedBox(height: 10.0,),
                      const SizedBox(height: 20.0,),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0,),
                            color: Colors.cyan,
                          ),
                          child: MaterialButton(

                            child: const Text(

                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),

                            onPressed: (){
                              print('scorrrre = $score');
                              if (_formKey.currentState!.validate()) {
                                      name = _nameContoller.text;
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (ctx){
                                            return FlashcardApp();
                                          }));
                              }

                            },)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );;
  }
}
