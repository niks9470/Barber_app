import 'package:barber_app/Admin_panel/booking_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminLoginpage extends StatefulWidget {
  const AdminLoginpage({super.key});

  @override
  State<AdminLoginpage> createState() => _AdminLoginpageState();
}

class _AdminLoginpageState extends State<AdminLoginpage> {
  TextEditingController usernameController =new TextEditingController();
  TextEditingController userpasswordController =new TextEditingController();

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
                "Admin\nPanel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Username",
                      style: TextStyle(
                          color: Color(0xffB91635),
                          fontSize: 22,
                          fontWeight: FontWeight.w200),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "User Name"
                        ),
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
                          controller: userpasswordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_outlined),
                            hintText: "Password",
                          ),
                          obscureText: true,
                          obscuringCharacter: "*",
                        )),

                    SizedBox(height: 50,),

                    GestureDetector(onTap: (){
                      loginAdmin();
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
                                "LOG IN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result){
        if(result.data()["id"]!=usernameController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your id is not correct",style: TextStyle(fontSize: 20),)));
        }
        else if
        (result.data()["password"]!=userpasswordController.text.trim()){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your password is not correct",style: TextStyle(fontSize: 20),)
        ));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingAdmin()));
        }

      });
    });
  }
}
