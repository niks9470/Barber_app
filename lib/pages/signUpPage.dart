import 'package:barber_app/Services/database.dart';
import 'package:barber_app/Services/shared_pref.dart';
import 'package:barber_app/pages/LoginPage.dart';
import 'package:barber_app/pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  String? name, mail, password;
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null && name != null && mail != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);
        String id=randomAlphaNumeric(10);
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveEmailKey(emailController.text);
        await SharedPreferenceHelper().saveUserId(id!);
        await SharedPreferenceHelper().saveImageKey("https://w7.pngwing.com/pngs/96/861/png-transparent-boy-cartoon-child-hat-boy-painted-hand-toddler-thumbnail.png");

        Map<String,dynamic> userInfoMap={
          "Name":nameController.text,
          "Email":emailController.text,
          "Id":id,
          "Image":"https://w7.pngwing.com/pngs/96/861/png-transparent-boy-cartoon-child-hat-boy-painted-hand-toddler-thumbnail.png",
        };
        await DatabaseMethod().addUserDetails(userInfoMap, id);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registerd Sucessfully",
          style: TextStyle(fontSize: 20,color: Colors.green),
        )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } on FirebaseAuthException catch (e) {

        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Password provided is show weak",
            style: TextStyle(fontSize: 20),
          )));

        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Account Already exists")));
        }
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
                "Create your \naccount",
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
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5),
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
                        "Name",
                        style: TextStyle(
                            color: Color(0xffB91635),
                            fontSize: 22,
                            fontWeight: FontWeight.w200),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter name";
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person), hintText: "Name"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                            if (value == null || value.isEmpty) {
                              return "Please Enter Email";
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
                              if (value == null || value.isEmpty) {
                                return "Please make a Password to signup!";
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
              
                      SizedBox(height: 50,),
              
                      GestureDetector(onTap: (){
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            mail=emailController.text;
                            name=nameController.text;
                            password=passwordController.text;
                          });
                        }
                        registration();
                        },
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width/1.3,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffB91635),
                                  Color(0xff621d3c),
                                  Color(0xff311937)
                                ]),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an account?",
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
                                  builder: (context) => Loginpage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Color(0xff621d3c),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
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
