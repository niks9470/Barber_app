import 'package:barber_app/Admin_panel/Admin_loginPage.dart';
import 'package:barber_app/pages/forgotPassword.dart';
import 'package:barber_app/pages/homePage.dart';
import 'package:barber_app/pages/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? mail, password;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail!, password: password!);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user Found for that email!",
          style: TextStyle(fontSize: 18, color: Colors.black),
        )));
      } else if (e.code == "wrong=password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Wrong password Provided by user!",
          style: TextStyle(fontSize: 18, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 20),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xffB91635),
                Color(0xff621d3c),
                Color(0xff311937)
              ])),
              child: Text(
                "Hello\nSign in!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 30),
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gmail",
                        style: TextStyle(
                            color: Color(0xffB91635),
                            fontSize: 22,
                            fontWeight: FontWeight.w200),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Please enter the email id";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: "Gmail"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Color(0xffB91635),
                            fontSize: 22,
                            fontWeight: FontWeight.w200),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Please Enter Your Password!";
                              }
                              return null;
                            },
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password_outlined),
                              hintText: "Password",
                            ),
                            obscureText: true,
                            obscuringCharacter: "*",
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpassword()));
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color(0xff311937),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              mail=emailController.text;
                              password=passwordController.text;
                            });
                            userLogin();
                          }
              
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffB91635),
                                Color(0xff621d3c),
                                Color(0xff311937)
                              ]),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Don't have account?",
                            style: TextStyle(
                                color: Color(0xff311937),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signuppage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Color(0xff621d3c),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60,),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginpage()));
                        },
                        child: Container(height: 50,
                          width: MediaQuery.of(context).size.width/1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                Color(0xffB91635),
                                Color(0xff621d3c),
                                Color(0xff311937)
                              ]),
                          ),
                          child: Center(child: Text("Click here if you are Admin >>",style: TextStyle(color: Colors.white,fontSize: 20),)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
