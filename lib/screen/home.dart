import 'package:flutter/material.dart';
import 'package:kormobarta/utility/colors.dart';
import 'package:kormobarta/widget/app_bar.dart';
import 'package:kormobarta/widget/card.dart';
import 'package:kormobarta/widget/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: textRoboro(text: 'Kormo Barta', color: blackColor, isTile: true, fontSize: 20)),
        body: ListView.builder(itemBuilder: (context, index) {
      return CardWidget();
    },),);
  }
}