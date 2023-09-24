import 'dart:async';

import 'package:absensi_simulasi_mmtc_20/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  String checkIn = "--/--";
  String checkOut = "--/--";

  Color primary = Color(0xFF176B87);

  @override
  void initState() {
    super.initState();
    _getRecord();
  }

  void _getRecord() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("NIM").where('id', isEqualTo: User.usernameId).get();

      DocumentSnapshot querySnapshot2 = await FirebaseFirestore.instance.collection("NIM").doc(querySnapshot.docs[0].id).collection("Record")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();

      setState(() {
        checkIn = querySnapshot2['checkIn'];
        checkOut = querySnapshot2['checkOut'];
      });

    } catch (e) {
      setState(() {
        checkIn = "--/--";
        checkOut = "--/--";
      });
    }
    print(checkIn);
    print(checkOut);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                "NIM",
                style: TextStyle(
                  color: Colors.black26,
                  fontFamily: "font_2",
                  fontSize: screenWidth / 15,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                User.usernameId,
                style: TextStyle(
                  fontFamily: "font_2",
                  fontSize: screenWidth / 10,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                "Status absen hari ini",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "font_2",
                  fontSize: screenWidth / 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 30),
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "font_2",
                            fontSize: screenWidth / 20,
                            color: Colors.black26,
                          ),
                        ),
                        Text(
                          checkIn,
                          style: TextStyle(
                            fontFamily: "font_2",
                            fontSize: screenWidth / 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "font_2",
                            fontSize: screenWidth / 20,
                            color: Colors.black26,
                          ),
                        ),
                        Text(
                          checkOut,
                          style: TextStyle(
                            fontFamily: "font_2",
                            fontSize: screenWidth / 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                    color: primary,
                    fontSize: screenWidth / 15,
                    fontFamily: "font_2",
                  ),
                  children: [
                    TextSpan(
                      text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 15,
                        fontFamily: "font_2",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('hh:mm:ss a').format(DateTime.now()),
                    style: TextStyle(
                      fontFamily: "font_2",
                      fontSize: screenWidth / 20,
                      color: Colors.black26,
                    ),
                  ),
                );
              }
            ),
            checkOut == "--/--" ? Container(
              margin: const EdgeInsets.only(top : 20),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();

                  return SlideAction(
                    text: checkIn == "--/--" ? "Slide to checkIn" : "Slide to checkOut",
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    outerColor: Colors.white,
                    innerColor: primary,
                    key: key,

                  onSubmit: () async {

                    //
                    // Timer(Duration(seconds: 1), () {
                    //   key.currentState!.reset();
                    // });

                    // Future.delayed(Duration(milliseconds: 500), (){
                    //   key.currentState!.reset();
                    //
                    // });

                      print(DateFormat('hh:mm').format(DateTime.now()));

                      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("NIM").where('id', isEqualTo: User.usernameId).get();

                      print(querySnapshot.docs[0].id);
                      print(DateFormat('dd MMMM yyyy').format(DateTime.now()));

                      DocumentSnapshot querySnapshot2 = await FirebaseFirestore.instance.collection("NIM").doc(querySnapshot.docs[0].id).collection("Record")
                          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                          .get();

                      try {
                        // if(querySnapshot2['checkIn']);
                        String checkIn = querySnapshot2['checkIn'];

                        setState(() {
                          checkOut = DateFormat('hh:mm').format(DateTime.now());
                        });

                        await FirebaseFirestore.instance.collection("NIM").doc(querySnapshot.docs[0].id).collection("Record")
                            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now())).update({
                          'date' : Timestamp.now(),
                          'checkIn' : checkIn,
                          'checkOut' : DateFormat('hh:mm').format(DateTime.now())
                        });

                      } catch (e) {

                        setState(() {
                          checkIn = DateFormat('hh:mm').format(DateTime.now());
                        });
                        await FirebaseFirestore.instance.collection("NIM").doc(querySnapshot.docs[0].id).collection("Record")
                            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now())).set({
                          'date' : Timestamp.now(),
                          'checkIn' : DateFormat('hh:mm').format(DateTime.now()),
                          'checkOut' : "--/--",
                        });
                      }

                      key.currentState!.reset();
                      
                      // print(querySnapshot2['checkIn']);

                      print("Database Firebase terpanggil: ${querySnapshot.docs.length}");

                  // key.currentState!.reset();
                  });
                },
              ),
            ) : Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text("You have completed this day",
                style: TextStyle(
                  fontFamily: "font_2",
                  fontSize: screenWidth / 20,
                  color: Colors.black26,
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
