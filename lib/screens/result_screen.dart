import 'package:flutter/material.dart';
import 'package:quiz/models/home_tile_select.dart';
import 'package:quiz/models/result.dart';

class ResultScreen extends StatelessWidget {
  var score = 0;
  var tile = 'Flutter';
  late  var mContext;

  ResultScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final routingArgument = ModalRoute.of(context)!.settings.arguments as Result;
    score = routingArgument.score;
    tile = routingArgument.tileName;
    mContext = context;

    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;


    return Scaffold(
      body: Stack(children: [
        Container(
            color: const Color(0xff6066d0),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0.5,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                width: deviceWidth(context) * 0.75,
                height: deviceHeight(context) * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'YOUR SCORE IS',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '$score/10',
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        // color: Color(0xffb8e893),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: subButton(),
                    ),
                  ],
                ),
              ),
            )),
        Container(
          decoration: BoxDecoration(
            color: (score > 5) ? const Color(0xffb8e893) : Colors.red,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          width: deviceWidth(context) * 0.6,
          height: deviceWidth(context) * 0.06,
          margin: EdgeInsets.only(
            top: deviceHeight(context) * 0.36,
            left: deviceWidth(context) * 0.205,
          ),
          child: Center(
            child: Text(
              (score > 5) ? 'CONGRATULATIONS' : 'LOW SCORE',
              style:
              TextStyle(color: (score > 5) ? Colors.black : Colors.white),
            ),
          ),
        ),
      ]),
    );
  }

  Widget subButton()
  {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor:
          (score > 5) ? const Color(0xffb8e893) : Colors.red),
          onPressed: navigateToHome,
      child: Text(
        (score > 5) ? 'FINISH' : 'RETAKE QUIZ',
        style: TextStyle(
            fontSize: 15.0,
            color: (score > 5) ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600),
      ),

    );
  }



  void navigateToHome() {
    if(score>=7){
      Navigator.pushNamed(mContext, '/welcome');
    }else{
      Navigator.pushNamed(mContext, '/quiz',arguments: HomeTileModel(tileName:tile));
    }
  }
}
