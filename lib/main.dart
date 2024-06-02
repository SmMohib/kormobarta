import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kormobarta/provider/user_provider.dart';
import 'package:kormobarta/widget/bottom_nev.dart';
import 'package:provider/provider.dart';



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
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()..checkAuth()),
      ],
      child: MaterialApp(
        title: 'Kormo Barta',
        theme: ThemeData(
          primaryColor: Theme.of(context).primaryColor,
          primarySwatch: Colors.blue,
        ),debugShowCheckedModeBanner: false,
        home:BottomNev() ,
      ),
    );
  }
}

// class AuthCheck extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserProvider>(
//       builder: (context, userProvider, _) {
//         if (userProvider.user != null) {
//           return Profile();
//         } else {
//           return LoginScreen();
//         }
//       },
//     );
//   }
// }