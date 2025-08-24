import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/question_model.dart';
import '../widgets/question_widget.dart' as widget_widgets;
import '../widgets/next_button.dart';

import '../widgets/result_box.dart';
import '../model/db_connect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = DBconnect();
  late Future<List<Question>> _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestion();
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          result: score,
          questionLength: questionLength,
          onPressed: startOver,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select at least one option"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20.0),
          ),
        );
      }
    }
  }

  void CheckAnswerAndUpdate(bool value) {
    if (isAlreadySelected) return;

    if (value == true) {
      score++;
    }

    setState(() {
      isPressed = true;
      isAlreadySelected = true;
    });
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isAlreadySelected = false;
      isPressed = false;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Question>>(
      future: _questions,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data!;

            if (extractedData.isEmpty) {
              return const Center(child: Text("No questions available"));
            }

            if (index >= extractedData.length) {
              return const Center(child: Text("Invalid question index"));
            }

            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.blue,
                shadowColor: Colors.transparent,
                title: const Text('Quiz App',
                    style: const TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 26),),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Score: $score",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: LinearProgressIndicator(
                        value: (index + 1) / extractedData.length,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.blueAccent,
                        minHeight: 8.0,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),

                      child: widget_widgets.QuestionWidget(
                        key: ValueKey<int>(index),  // <- important for AnimatedSwitcher to detect change
                        indexAction: index,
                        question: extractedData[index].title,
                        totalQuestions: extractedData.length,
                      ),
                    ),

                    const Divider(color: neutral),
                    const SizedBox(height: 24.0),
                    for (int i = 0; i < extractedData[index].options.length; i++)
                      GestureDetector(
                        onTap: () => CheckAnswerAndUpdate(
                          extractedData[index].options.values.toList()[i],
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: isPressed
                                ? extractedData[index].options.values.toList()[i] == true
                                ? correct
                                : incorrect
                                : neutral,
                            bo
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                extractedData[index].options.keys.toList()[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: isPressed
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (isPressed)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    extractedData[index].options.values.toList()[i] == true
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
          }
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}