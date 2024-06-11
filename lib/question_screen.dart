import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currInd = 0;
  void updateInd(String selectedAnswer) {
    widget.onSelectedAnswer(
        selectedAnswer); //widget allows us to access the function of statefulwidget from this state class
    setState(
      () {
        currInd++;
      },
    );
  }

  @override
  Widget build(context) {
    final currQues = ques[currInd];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQues.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            ...currQues.getShuffledAnswers().map((answer) {
              return AnswerButton(
                ans: answer,
                onTap: (){
                  updateInd(answer);
                },
              );
            })

            // AnswerButton(
            //   ans: currQues.answers[0],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   ans: currQues.answers[1],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   ans: currQues.answers[2],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   ans: currQues.answers[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
