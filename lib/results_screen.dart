import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/question_summary.dart';
import 'package:quiz/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': ques[i].text,
          'correct_answer': ques[i].answers[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQues=ques.length;
    final summaryData=getSummaryData();
    final numcorrectans=summaryData.where((element){
      return element['user_answer']==element['correct_answer'];
    } ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numcorrectans out of $numTotalQues questions correctly!'),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: (){},
              child: const Text(
                'Restart quiz!',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
