

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kormobarta/screen/home.dart';
import 'package:kormobarta/utility/colors.dart';
import 'package:kormobarta/widget/bottom_nev.dart';

void main()async {

await Firebase.initializeApp(
  options: const FirebaseOptions(  apiKey: "AIzaSyDGH6YlYxm_OLa-TtEKxfXQDgy2Apn79bM",
  authDomain: "jobapp-3eed5.firebaseapp.com",
  projectId: "jobapp-3eed5",
  storageBucket: "jobapp-3eed5.appspot.com",
  messagingSenderId: "566124655661",
  appId: "1:566124655661:web:36ace18c82793427a3b4a4",
  measurementId: "G-ZP2DEEKP7M")
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomNev(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
     
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
      
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
