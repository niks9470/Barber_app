import 'package:barber_app/Services/shared_pref.dart';
import 'package:barber_app/pages/booking.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //FOR GET THE NAME AND IMAGE FROM THE USER WHILE SIGN UP
  String?  name,image;
  getthedatafromsharedpref()async{
    name = await SharedPreferenceHelper().getUserName();
    image =await SharedPreferenceHelper().getUserImage();
    setState(() {
    });
  }
  getontheload() async{
    await getthedatafromsharedpref();
    setState(() {

    });
  }
  @override
  void initState() {
getontheload();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b1615),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                     image! ,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white38,
            ),
            Text(
              "Services",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: "Classic Saving")));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffe29452),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/shaving.png",
                            height: 95,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Classic Saving",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: "Hair Washing")));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffe29452),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Image.asset("assets/hair.png",
                            height: 95, width: 80, fit: BoxFit.cover),
                        Text(
                          "Hair Washing",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,

                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service:"Facial" )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffe29452),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/facials.png",
                            height: 95,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Facial",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: "Kids")));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffe29452),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Image.asset("assets/kids.png",
                            height: 95, width: 80, fit: BoxFit.cover),
                        Text(
                          "Kids",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: "Beard trimming")));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffe29452),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/beard.png",
                          height: 95,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "Beard trimming",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: "Hair Cutting")));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffe29452),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Image.asset("assets/cutting.png",
                            height: 95, width: 80, fit: BoxFit.cover),
                        Text(
                          "Hair Cutting",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
