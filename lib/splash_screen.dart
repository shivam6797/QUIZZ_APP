import 'package:flutter/material.dart';
import 'package:quizz_app/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Future.delayed(Duration(seconds: 3), () {
     Navigator.pushReplacementNamed(context,AppRoutes.ROUTE_HOME);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand, children: [
      Container(
        color: Colors.black12,
      ),
      Center(
        child: Image.asset(
          'assets/images/quiz_app_logo.png',
          height: 200,
          width: 200,
        ),
      ),
    ]);
  }
}
