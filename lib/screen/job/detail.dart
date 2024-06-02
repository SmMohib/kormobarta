import 'package:flutter/material.dart';
import '../../model/data_model.dart';

class DetailScreen extends StatefulWidget {
  final JobPosting jobPosting;

  DetailScreen({required this.jobPosting});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jobPosting.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(
              widget.jobPosting.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              widget.jobPosting.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.jobPosting.description,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Location: ${widget.jobPosting.location}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Website: ${widget.jobPosting.website}',
              style: TextStyle(fontSize: 16, color: Colors.blue),
              
            ),
            const SizedBox(height: 10),
            Text(
              'Start Date: ${widget.jobPosting.startDate}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'End Date: ${widget.jobPosting.endDate}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Posted on: ${widget.jobPosting.timestamp.toLocal()}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
