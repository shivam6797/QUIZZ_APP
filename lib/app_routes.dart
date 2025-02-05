import 'package:flutter/cupertino.dart';
import 'package:quizz_app/available_task_screen.dart';
import 'package:quizz_app/home_screen.dart';
import 'package:quizz_app/quiz_task_screen.dart';
import 'package:quizz_app/splash_screen.dart';

class AppRoutes {
  static const String ROUTE_SPLASH = "/";
  static const String ROUTE_HOME = "/home";
  static const String ROUTE_AVAILABLE_TASK = "/available_task";
  static const String ROUTE_QUIZ_TASK = "/quiz_task";




 static Map<String, WidgetBuilder> getRoutes() => {
        ROUTE_SPLASH: (context) => SplashScreen(),
        ROUTE_HOME: (context) => HomeScreen(),
        ROUTE_AVAILABLE_TASK: (context) => AvailableTaskScreen(),
        ROUTE_QUIZ_TASK: (context) => QuizScreen(),

      };
}
