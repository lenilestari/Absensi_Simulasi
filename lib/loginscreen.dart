import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = Color(0xFF176B87);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight / 3,
            width: screenWidth,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: screenWidth / 4,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenHeight / 30, // Mengubah jarak ke bawah
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidth / 20,
                fontFamily: "font_1",
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth / 12,
            ),
            child: Column(

              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Leni Lestari",
                    style: TextStyle(
                      fontSize: screenWidth / 26,
                      fontFamily: "font_2",
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth / 15,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenHeight / 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
