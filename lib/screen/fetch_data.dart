 import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kormobarta/utility/colors.dart';
import 'package:kormobarta/widget/text.dart';

import '../model/data_model.dart';
class JobListingScreen extends StatefulWidget {
  @override
  _JobListingScreenState createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  Future<List<JobPosting>> _fetchJobPostings() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('job_postings').get();
    return snapshot.docs.map((doc) => JobPosting.fromDocument(doc)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: textRoboro(text: 'Kormo Barta', color: blackColor, isTile: true, fontSize: 20)),
      body: FutureBuilder<List<JobPosting>>(
        future: _fetchJobPostings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No job postings found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                JobPosting jobPosting = snapshot.data![index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(jobPosting.title),
                      subtitle: Text(jobPosting.description),
                      onTap: () {
                        // Handle job posting tap if needed
                      },
                    ),const Divider()
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

