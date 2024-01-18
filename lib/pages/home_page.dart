import 'package:flutter/material.dart';
import 'package:quiz_app/models/congratulations.dart';
import 'package:quiz_app/models/main_button.dart';
import 'package:quiz_app/models/question_with_answer.dart';
import 'package:quiz_app/models/show_answers_button.dart';
import 'package:quiz_app/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFinished = false;
  int questionIndex = 0;
  int points = 0;
  AppState instanceState = AppState.asking;

  List<int> selectedAnswers =
      List.generate(questionsWithAnswers.length, (_) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (instanceState == AppState.asking ||
                instanceState == AppState.showAnswers) ...[
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20),
                child: Text(
                  questionsWithAnswers[questionIndex].Question,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Answer and get points!",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: UsedColors.grey,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      "step ${questionIndex + 1} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "of ${questionsWithAnswers.length}",
                      style: const TextStyle(
                        color: UsedColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: fun(),
                ),
              ),
            ],
            if (instanceState == AppState.asking) ...[
              Column(
                children: questionsWithAnswers[questionIndex]
                    .answers
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () => setState(
                              () {
                                if (selectedAnswers[questionIndex] != e.id) {
                                  selectedAnswers[questionIndex] = e.id;
                                } else {
                                  selectedAnswers[questionIndex] = 0;
                                }
                                // print(selectedAnswers);
                              },
                            ),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: selectedAnswers[questionIndex] == e.id
                                    ? UsedColors.green
                                    : UsedColors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(130, 158, 158, 158),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.add,
                                      color:
                                          selectedAnswers[questionIndex] == e.id
                                              ? UsedColors.white
                                              : UsedColors.black,
                                    ),
                                  ),
                                  Text(
                                    e.data,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color:
                                          selectedAnswers[questionIndex] == e.id
                                              ? UsedColors.white
                                              : UsedColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ] else if (instanceState == AppState.congrating)
              Congratulations(
                points: points,
              )
            else
              Column(
                children: questionsWithAnswers[questionIndex]
                    .answers
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: questionsWithAnswers[questionIndex]
                                            .correctAnswer ==
                                        e.id
                                    ? UsedColors.green
                                    : selectedAnswers[questionIndex] == e.id
                                        ? UsedColors.red
                                        : UsedColors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(130, 158, 158, 158),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.add,
                                      color: questionsWithAnswers[questionIndex]
                                                  .correctAnswer ==
                                              e.id
                                          ? UsedColors.white
                                          : selectedAnswers[questionIndex] ==
                                                  e.id
                                              ? UsedColors.white
                                              : UsedColors.black,
                                    ),
                                  ),
                                  Text(
                                    e.data,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: questionsWithAnswers[questionIndex]
                                                  .correctAnswer ==
                                              e.id
                                          ? UsedColors.white
                                          : selectedAnswers[questionIndex] ==
                                                  e.id
                                              ? UsedColors.white
                                              : UsedColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            if (instanceState != AppState.congrating) const Spacer(),
            if (instanceState == AppState.asking)
              if (selectedAnswers[questionIndex] == -1)
                const Text(
                  "You must choose answer!",
                  style: TextStyle(
                    color: UsedColors.red,
                  ),
                ),
            if (instanceState == AppState.congrating)
              ShowAnswersButton(
                onPressed: () {
                  setState(
                    () {
                      instanceState = AppState.showAnswers;
                      questionIndex = 0;
                    },
                  );
                },
              ),
            MainButton(
              instanceState: instanceState,
              onTap: () => {
                setState(
                  () {
                    // print(selectedAnswers);

                    if (instanceState == AppState.congrating) {
                      instanceState = AppState.asking;
                      points = 0;
                      selectedAnswers =
                          List.generate(selectedAnswers.length, (_) => 0);
                      questionIndex = 0;
                      return;
                    }
                    if (instanceState == AppState.showAnswers) {
                      if (questionIndex < questionsWithAnswers.length - 1) {
                        questionIndex++;
                      } else {
                        instanceState = AppState.congrating;
                      }
                      return;
                    }
                    if (selectedAnswers[questionIndex] != 0 &&
                        selectedAnswers[questionIndex] != -1) {
                      if (selectedAnswers[questionIndex] ==
                          questionsWithAnswers[questionIndex].correctAnswer) {
                        points++;
                      }
                      if (questionIndex < questionsWithAnswers.length - 1) {
                        questionIndex++;
                      } else {
                        instanceState = AppState.congrating;
                      }
                    } else {
                      selectedAnswers[questionIndex] = -1;
                    }
                    // print(selectedAnswers);
                  },
                )
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> fun() {
    List<Widget> ret = [];
    for (int i = 0; i <= questionIndex; i++) {
      ret.add(
        const Expanded(
          child: Divider(
            thickness: 3,
            color: UsedColors.green,
          ),
        ),
      );
    }
    for (int i = questionIndex + 1; i < questionsWithAnswers.length; i++) {
      ret.add(
        const Expanded(
          child: Divider(
            thickness: 3,
            color: Color.fromARGB(200, 158, 158, 158),
          ),
        ),
      );
    }
    return ret;
  }
}

enum AppState { asking, congrating, showAnswers }
