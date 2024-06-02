// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kormobarta/screen/fetch_data.dart';
import 'package:kormobarta/screen/home.dart';
import 'package:kormobarta/screen/profile.dart';
import 'package:kormobarta/utility/colors.dart';


class BottomNev extends StatefulWidget {
  const BottomNev({super.key});

  @override
  State<BottomNev> createState() => _BottomNevState();
}

class _BottomNevState extends State<BottomNev> {
 int current_index = 0;
  final List<Widget> pages = [Home(), Center(child: const Text('Search')), Profile()];
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
          backgroundColor:primaryColor,
          iconSize: 26,
          selectedItemColor: Colors.blue,
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