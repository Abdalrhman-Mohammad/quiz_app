import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';
import 'package:quiz_app/utils/colors.dart';

class Congratulations extends StatelessWidget {
  final int points;
  const Congratulations({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 50,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(140, 158, 158, 158),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "YOUR SCORE $points \\ ${questionsWithAnswers.length}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(62, 158, 222, 1.0),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "See you in the next quiz ",
                  style: TextStyle(
                    color: UsedColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
