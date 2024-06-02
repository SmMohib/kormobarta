import 'package:flutter/material.dart';
import 'package:kormobarta/utility/colors.dart';
import 'package:kormobarta/widget/text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
       centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: textRoboro(text: 'Search', color: blackColor, isTile: true, fontSize: 20)),
    body: Center(child: textRoboro(text: 'Search', color: blackColor, isTile: true, fontSize: 20) ,),);
  }
}