import 'package:flutter/material.dart';
import 'package:kormobarta/provider/user_provider.dart';
import 'package:kormobarta/screen/auth/login_screen.dart';
import 'package:kormobarta/screen/job/jobpost.dart';
import 'package:provider/provider.dart';

import '../../utility/colors.dart';
import '../../widget/text.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: textRoboro(text: 'Profile', color: blackColor, isTile: true, fontSize: 20),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await Provider.of<UserProvider>(context, listen: false).logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Company Name: Your Company',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description: Your company description goes here.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage('assets/company_logo.png'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobPostingScreen()),
                );
              },
              child: const Text('Post a Job'),
            ),
          ],
        ),
      ),
    );
  }
}
