import 'package:flutter/material.dart';
import 'package:quiz/models/home_tile_select.dart';
import 'package:quiz/models/question_model.dart';
import 'package:quiz/models/result.dart';

import '../data/questions_list.dart';
import '../shared/color.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questionList = questions;
  var tile = 'Flutter';

  int questionPos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next";
  bool answered = false;
  int questionNumber = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }


  @override
  Widget build(BuildContext context) {
    final routingArgument = ModalRoute.of(context)!.settings.arguments as HomeTileModel;
    if(routingArgument.tileName!=null){
      tile = routingArgument.tileName;
      switch (routingArgument.tileName) {
        case 'Flutter':
            questionList = questions;
          break;

        case 'React Native':
            questionList = reactNative;
          break;

        case 'Android':
          questionList = android;
          break;

        case 'Swift':
          questionList= swift;
          break;

        default: {
          //Body of default case
          questionList = questions;
        } break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            controller: _controller!,
            onPageChanged: (page) {
              if (page == questionList.length - 1) {
                setState(() {
                  btnText = "Submit";
                });
              }
              setState(() {
                answered = false;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              questionNumber = index +1;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("images/quiz.jpeg"),

                  Container(
                    color: const Color.fromARGB(255, 184, 232, 147),
                    height: 350.0,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 70.0,
                            child: Text("$questionNumber )  "
                              "${questionList[index].question}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          for (int i = 0; i < questionList[index].answers!.length; i++)
                            Container(
                              width: double.infinity,
                              height: 30.0,
                              margin: const EdgeInsets.only(
                                  bottom: 20.0, left: 12.0, right: 12.0),
                              child: RawMaterialButton(
                                shape: const StadiumBorder(),
                                fillColor: btnPressed
                                    ? questionList[index].answers!.values.toList()[i]
                                    ? Colors.green
                                    : Colors.red
                                    : AppColor.secondaryColor,
                                onPressed: !answered
                                    ? () {
                                  if (questionList[index]
                                      .answers!
                                      .values
                                      .toList()[i]) {
                                    score++;
                                    print("yes");
                                  } else {
                                    print("no");
                                  }
                                  setState(() {
                                    btnPressed = true;
                                    answered = true;
                                  });
                                }
                                    : null,

                                child: Text(questionList[index].answers!.keys.toList()[i],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    )),
                              ),
                            ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              if (_controller!.page?.toInt() == questionList.length - 1) {
                                Navigator.pushNamed(context, '/result',arguments: Result( score: score,tileName: tile));
                              } else {
                                _controller!.nextPage(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInExpo);

                                setState(() {
                                  btnPressed = false;
                                });
                              }
                            },
                            shape: const StadiumBorder(),
                            fillColor: Colors.orange,
                            padding: const EdgeInsets.all(10.0),
                            elevation: 0.0,
                            child: Text(
                              btnText,
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        ]

                    ),
                  ),




                ],
              );
            },
            itemCount: questionList.length,
          )),
    );
  }
}
