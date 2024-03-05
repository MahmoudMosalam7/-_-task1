import 'dart:async';
import 'package:flashcardquizapp/constant.dart';
import 'package:flashcardquizapp/model/option.dart';
import 'package:flashcardquizapp/screens/result.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/flashcard.dart';
import '../widget/flashcard_view.dart';

class FlashcardApp extends StatefulWidget {
  const FlashcardApp({super.key});

  @override
  State<FlashcardApp> createState() => _FlashcardAppState();
}

class _FlashcardAppState extends State<FlashcardApp> {
  List<FlashCard> _flashCards=[
    FlashCard(question:'what language does flutter uses' ,answer:'Dart' ,id: 1),
    FlashCard(question:'what language does react uses' ,answer:'JavaScript',
        id: 3 ),
    FlashCard(question:'what language does angular uses' ,answer:'JavaScript',
        id: 2 ),
    FlashCard(question:'what language does electron uses' ,answer:'JavaScript',
        id: 3 )
    ,
    FlashCard(question:'what language does react native uses' ,
        answer:'JavaScript',id: 1 ),
  ];
  List<Option> _option = [
    Option(text1: 'Dart', text2: 'JavaScript', text3: 'Python', id: 1),
    Option(text1: 'Dart', text2: 'java', text3: 'JavaScript', id: 3),
    Option(text1: 'Ruby', text2: 'JavaScript', text3: 'Go', id: 2),
    Option(text1: 'C#', text2: 'C++', text3: 'JavaScript', id: 3),
    Option(text1: 'JavaScript', text2: 'java', text3: 'Python', id: 1),
  ];
  bool _correct = false;
  int _currentIndex = 0;
  int _selectedValue = 1;
  bool _onTouch = false;
  static const _maxSeconds = 60;
  int _seconds = _maxSeconds;
  Timer? _timer;

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard Quiz App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  key: cardKey,
                  flipOnTouch: _onTouch,
                  front: FlashCardView(text: _flashCards[_currentIndex].question),
                  back: FlashCardView(text: _flashCards[_currentIndex].answer),
                ),
              ),

              SizedBox(height: 10,),
              radioOptions(_option[_currentIndex].text1,
                  _option[_currentIndex].text2,
                  _option[_currentIndex].text3
              ),
              SizedBox(height: 10,),
              // to make next and previos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon
                    (onPressed: previousCard,
                      icon: Icon(Icons.chevron_left
                      ,color: Colors.cyan,
                      ),
                      label: Text('Prev'
                      ,style: TextStyle(
                          color: Colors.cyan
                        ),
                      )),

                  OutlinedButton.icon
                    (onPressed: nextCard,
                      icon: Icon(Icons.chevron_right
                      ,color: Colors.cyan,
                      ),
                      label: Text('Next',
                      style: TextStyle(
                        color: Colors.cyan
                      ),
                      )),
                ],
              ),
              SizedBox(height: 10,),
              buildTimer()
            ],
          ),
        ),
      ),
    );
  }
  void nextCard() {
    setState(() {
      _correct = false;
      _currentIndex = (_currentIndex + 1 < _flashCards.length) ? _currentIndex
          + 1 : _flashCards.length ;
      _selectedValue = 1;
      if(_onTouch){
        cardKey.currentState!.toggleCard();
      }
      if(_currentIndex == _flashCards.length){
        _currentIndex--;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          _timer?.cancel();
          return Result();
        }));
      }
    });
  }

  void previousCard() {
    setState(() {
      _correct = false;
      _currentIndex = (_currentIndex - 1 >= 0) ? _currentIndex - 1 : 0;
      _selectedValue = 1;
      if(_onTouch){
        cardKey.currentState!.toggleCard();

      }
    });
  }

  Widget radioOptions(String option1 ,String option2,String option3){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select the Correct Answer:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Radio(
                value: 1,
                activeColor: Colors.cyan,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value as int;
                    if(_option[_currentIndex].id == _selectedValue){
                      _onTouch = true;
                      score++;
                      cardKey.currentState!.toggleCard();
                    }else{
                      _onTouch = false;
                      _currentIndex = (_currentIndex + 1 < _flashCards.length) ?
                      _currentIndex + 1 : _flashCards.length ;
                      if(_currentIndex == _flashCards.length){
                        _currentIndex--;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context){
                          _timer?.cancel();
                          return Result();
                        }));
                      }
                    }
                  });
                },
              ),
              Text(option1),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                activeColor: Colors.cyan,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value as int;
                    if(_option[_currentIndex].id == _selectedValue){
                      _onTouch = true;
                      score++;
                      cardKey.currentState!.toggleCard();
                    }else{
                      _onTouch = false;
                      _currentIndex = (_currentIndex + 1 < _flashCards.length) ?
                      _currentIndex + 1 : _flashCards.length ;
                      if(_currentIndex == _flashCards.length){
                        _currentIndex--;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context){
                              _timer?.cancel();
                              return Result();
                            }));
                      }
                    }
                  });
                },
              ),
              Text(option2),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                activeColor: Colors.cyan,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value as int;
                    if(_option[_currentIndex].id == _selectedValue){
                      score++;
                      _onTouch = true;
                      cardKey.currentState!.toggleCard();
                    }else{
                      _onTouch = false;
                      _currentIndex = (_currentIndex + 1 < _flashCards.length) ?
                      _currentIndex + 1 : _flashCards.length ;
                      if(_currentIndex == _flashCards.length){
                        _currentIndex--;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context){
                              _timer?.cancel();
                              return Result();
                            }));
                      }
                    }
                  });
                },
              ),
              Text(option3),
            ],
          ),
          // Add more rows for additional radio buttons as needed.
        ],
      ),
    );
  }

  Widget buildButtons(){
    return buttonWidget(
        text: 'Start Timer',
        onClicked: (){
          startTimer();
        }
    );
  }
  Widget buildTimer() => SizedBox(
    height: 100,
    width: 100,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: _seconds / _maxSeconds,
          valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
          strokeWidth: 8,
          backgroundColor: Colors.cyan,
        ),
        Center(
          child: buildTime(),
        ),
      ],
    ),
  );

  Widget buildTime(){
    return Text('$_seconds',style: TextStyle(
        color: Colors.black,
        fontSize: 40
    ),);
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_seconds >0){
        setState(() {
          _seconds--;
        });
      }else{

        timer?.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){

          return Result();
        }));
      }

    });
  }
}
