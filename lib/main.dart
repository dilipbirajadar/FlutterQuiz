import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_screen.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:quiz/screens/welcome_screen.dart';
import 'package:quiz/theme/custom_theme/custom_theme.dart';

void main() {
  runApp( MaterialApp(
    home: const WelcomeScreen(),
    theme: CustomTheme.lightTheme,
    routes: {
      '/welcome':(context)=> const WelcomeScreen(),
      '/home':(context)=> const HomeScreen(),
      '/quiz':(context)=> const QuizScreen(),
      '/result':(context) => ResultScreen(),
    },
  ));
}


