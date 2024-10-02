import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b1615),
      body: Container(
        margin: EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Image.asset("assets/barber.png"),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0xffdf711a),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Get Stylish Haircut",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
