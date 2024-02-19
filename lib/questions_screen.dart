import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/questions/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(answerText: answer, onTap: answerQuestion);
              },
            )
          ],
        ),
      ),
    );
  }
}
