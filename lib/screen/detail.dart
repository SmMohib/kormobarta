// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:kormobarta/widget/text.dart';
import 'package:adcolony_flutter/adcolony_flutter.dart';
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail'),),
        body: SingleChildScrollView(
          child: Column(children: [Text('data')],), 
        ),
        
        
    
    
    );
  }
}