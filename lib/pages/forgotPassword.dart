import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  String? email;
  TextEditingController mailController = new TextEditingController();

  final _formkey =GlobalKey<FormState>();

  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email:email!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Email has been sent!",style: TextStyle(fontSize: 20,color: Colors.green),)));
    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
        Text("No user found for that email!",style: TextStyle(fontSize: 20,color: Colors.green),)));

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),SizedBox(height: 10,),
      Text(
        "Enter your Email",
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 30,),
      Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            border:Border.all(color: Colors.white,width: 2),
            borderRadius: BorderRadius.circular(10),

          ),
          child: TextFormField(
            controller: mailController,
            validator: (value){
              if(value==null||value.isEmpty){
                return "Please Enter your Email";
              }
              return null;
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              suffixIcon: Icon(Icons.mail,color: Colors.white,),
             // helperStyle: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),SizedBox(height: 50,),
            GestureDetector(
              onTap: ()async{
                if(_formkey.currentState!.validate()){
                  setState(() {
                    email=mailController.text;
                  });
                  resetPassword();
                }},
              child: Container(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffdf711a),
                ),
                child: Text(
                  "Send Email",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
