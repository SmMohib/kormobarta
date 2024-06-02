import 'package:cloud_firestore/cloud_firestore.dart';

class JobPosting {
  String id;
  String title;
  String description;
  String location;
  String website;
  String startDate;
  String endDate;
  String imageUrl;
  DateTime timestamp;

  JobPosting({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.website,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.timestamp,
  });

  factory JobPosting.fromDocument(DocumentSnapshot doc) {
    return JobPosting(
      id: doc.id,
      title: doc['title'],
      description: doc['description'],
      location: doc['location'],
      website: doc['website'],
      startDate: doc['startDate'],
      endDate: doc['endDate'],
      imageUrl: doc['imageUrl'],
      timestamp: (doc['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'location': location,
      'website': website,
      'startDate': startDate,
      'endDate': endDate,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }
}
