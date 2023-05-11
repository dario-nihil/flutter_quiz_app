import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, {super.key});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int idx = 0; idx < chosenAnswers.length; idx++) {
      summary.add(
        {
          'question_idx': idx,
          'question': questions[idx].text,
          'correct_answer': questions[idx].answers[0],
          'user_answer': chosenAnswers[idx],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You answer X out of Y questions correctly'),
              const SizedBox(
                height: 30,
              ),
              const Text('Lists of asnwers and quesions...'),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Restart Quiz!',
                ),
              )
            ],
          ),
        ));
  }
}
