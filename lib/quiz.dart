import 'package:flutter/material.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/results_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // @override
  // void initState() {
  //   currScreen =StartScreen(switchScreen);
  //   super.initState();
  // }
  List<String> selectedAnswer = [];

  var currScreen = 'start-screen'; 

  void switchScreen() {
    setState(() {
      currScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length==ques.length){
      setState(() {
        currScreen='results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget=StartScreen(switchScreen);

    if(currScreen=='question-screen'){
      screenWidget= QuestionScreen(onSelectedAnswer: chooseAnswer,);
    }
    if(currScreen=='results-screen'){
      screenWidget=ResultsScreen(chosenAnswer: selectedAnswer);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          // child: currScreen=='start-screen'?StartScreen(switchScreen):const QuestionScreen(),
        ),
      ),
    );
  }
}
