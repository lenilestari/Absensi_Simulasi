import 'package:absensi_simulasi_mmtc_20/profilescreen.dart';
import 'package:absensi_simulasi_mmtc_20/todayscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calenderscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = Color(0xFF176B87);

  int currentIndex = 0;

  List<IconData> navigationIcons = [
    FontAwesomeIcons.calendar,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user,
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          CalenderScreen(),
          TodayScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(const Radius.circular(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Memastikan jarak yang sama antara ikon-ikon
            children: [
              for (int i = 0; i < navigationIcons.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = i;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Menambahkan jarak di sini
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            navigationIcons[i],
                            color: i == currentIndex ? primary : Colors.black26,
                            size: i == currentIndex ? 30 : 26,
                          ),
                          i == currentIndex
                              ? Container(
                            margin: EdgeInsets.only(top: 6),
                            height: 3,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              color: primary,
                            ),
                          )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
