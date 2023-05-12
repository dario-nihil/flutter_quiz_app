import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.onRestartPress, {super.key});

  final List<String> chosenAnswers;
  final void Function() onRestartPress;

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
    final summaryData = getSummaryData();
    final numTotQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answer $numCorrectAnswers out of $numTotQuestions questions correctly',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(150, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: onRestartPress,
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Restart Quiz!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
