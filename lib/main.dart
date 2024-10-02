import 'package:barber_app/Admin_panel/Admin_loginPage.dart';
import 'package:barber_app/Admin_panel/booking_admin.dart';
import 'package:barber_app/pages/LoginPage.dart';
import 'package:barber_app/pages/booking.dart';
import 'package:barber_app/pages/forgotPassword.dart';
import 'package:barber_app/pages/homePage.dart';
import 'package:barber_app/pages/on_boarding.dart';
import 'package:barber_app/pages/signUpPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Loginpage(),
    );
  }
}

