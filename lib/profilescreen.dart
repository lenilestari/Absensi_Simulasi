import 'package:absensi_simulasi_mmtc_20/model/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = Color(0xFF176B87);
  String birth = "Date of Birth";

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
            margin: const EdgeInsets.only(top: 80, bottom: 25),
            height: 120,
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              color: primary,
            ),
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 80,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Nama ${User.usernameId}",
              style: TextStyle(
                fontFamily: "font_2",
                fontSize: 18,

              ),
            ),
          ),
          const SizedBox(height: 24,),
          textField("First Name", "Firt Name"),
          textField("Last Name", "Last Name"),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Date of Birth",
              style: TextStyle(
                fontFamily: "font_2",
                color: Colors.black26,
              ),
            ),
          ),

          GestureDetector (

            onTap: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1945),
                  lastDate: DateTime.now(),

                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: primary,
                          secondary: primary,
                          onSecondary: Colors.white,
                        ),
                        textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary: primary,
                            )
                        ),
                        textTheme: const TextTheme(
                          headline4: TextStyle(
                            fontFamily: "font_2",
                          ),
                          overline: TextStyle(
                            fontFamily: "font_2",
                          ),
                          button: TextStyle(
                            fontFamily: "font_2",
                          ),
                        ),

                      ),
                      child: child!,
                    );
                  }
              ).then((value){
                setState(() {
                  birth = DateFormat("MM/dd/yyyy").format(value!);
                });
              });

            },
            child: Container(
              height: kToolbarHeight,
              width: screenWidth,
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.only(left: 12),

              decoration :  BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black26,
                )
              ),
              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  birth,
                  style : const TextStyle(
                    color: Colors.black26,
                    fontFamily: "font_2",
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          textField("Address", "Address"),
        ],
      ),
      ),
    );
  }

  Widget textField(String hint, String title) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "font_2",
              color: Colors.black26,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12,),
          child: TextFormField(
            cursorColor: Colors.black26,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black26,
                fontFamily: "font_2",
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
