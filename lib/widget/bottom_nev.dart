// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kormobarta/provider/user_provider.dart';
import 'package:kormobarta/screen/auth/login_screen.dart';
import 'package:kormobarta/screen/job/fetch_data.dart';
import 'package:kormobarta/screen/home.dart';
import 'package:kormobarta/screen/auth/profile.dart';
import 'package:kormobarta/screen/searchScreen.dart';
import 'package:kormobarta/utility/colors.dart';
import 'package:provider/provider.dart';


class BottomNev extends StatefulWidget {
  const BottomNev({super.key});

  @override
  State<BottomNev> createState() => _BottomNevState();
}

class _BottomNevState extends State<BottomNev> {
 int current_index = 0;
  final List<Widget> pages = [
    JobListingScreen(), 
    SearchScreen(), 
    AuthCheck(),
  ];
  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconSize: 26,
          selectedItemColor: const Color.fromARGB(255, 9, 17, 23),
          unselectedItemColor: Colors.white,
          currentIndex: current_index,
          selectedFontSize: 20,
          unselectedFontSize: 14,
          onTap: OnTapped,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search", tooltip: "Search"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                tooltip: "Profile"),
          ]),
    );
  }

}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        if (userProvider.user != null) {
          return Profile();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}