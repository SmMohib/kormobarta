import 'package:flutter/material.dart';

class App_bar extends StatelessWidget {
  String ? title;
   App_bar({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return  AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title!));
  }
}