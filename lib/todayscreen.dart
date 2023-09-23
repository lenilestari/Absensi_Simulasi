import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = Color(0xFF176B87);

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
                "Welcome",
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
                "NIM",
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
                          "09:30",
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
                          "--/--",
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
                  text: "13",
                  style: TextStyle(
                    color: primary,
                    fontSize: screenWidth / 15,
                    fontFamily: "font_2",
                  ),
                  children: [
                    TextSpan(
                      text: " September 2023",
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
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "12:00:02 PM",
                style: TextStyle(
                  fontFamily: "font_2",
                  fontSize: screenWidth / 20,
                  color: Colors.black26,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top : 20),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();

                  return SlideAction(
                    text: "Slide to Check Out",
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    outerColor: Colors.white,
                    innerColor: primary,
                    key: key,
                    onSubmit: () {
                      key.currentState!.reset();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
