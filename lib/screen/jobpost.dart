import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class JobPostingScreen extends StatefulWidget {
  @override
  _JobPostingScreenState createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  String _imagePath = '';
  String _imageUrl = '';

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _imagePath = pickedImage.path;
      }
    });
  }

  Future<void> _uploadImageToStorage() async {
    if (_imagePath.isNotEmpty) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('job_images/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = storageRef.putFile(File(_imagePath));
      await uploadTask.whenComplete(() async {
        _imageUrl = await storageRef.getDownloadURL();
        print('Image uploaded successfully: $_imageUrl');
      });
    }
  }

  Future<void> _postJob() async {
    if (_imagePath.isNotEmpty) {
      await _uploadImageToStorage();
    }

    try {
      await FirebaseFirestore.instance.collection('job_postings').add({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'location': _locationController.text,
        'website': _websiteController.text,
        'startDate': _startDateController.text,
        'endDate': _endDateController.text,
        'imageUrl': _imageUrl,
        'timestamp': DateTime.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Job posting created successfully!')),
      );
      // Clear the form fields after successful submission
      _titleController.clear();
      _descriptionController.clear();
      _locationController.clear();
      _websiteController.clear();
      _startDateController.clear();
      _endDateController.clear();
      setState(() {
        _imagePath = '';
        _imageUrl = '';
      });
    } catch (e) {
      print('Error posting job: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post a Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (_imagePath.isNotEmpty)
              Image.file(
                File(_imagePath),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Job Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Job Description'),
              maxLines: null,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Job Location'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _websiteController,
              decoration: const InputDecoration(labelText: 'Official Website'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _startDateController,
              decoration: const InputDecoration(labelText: 'Job Start Date'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _endDateController,
              decoration: const InputDecoration(labelText: 'Job End Date'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _postJob,
              child: const Text('Post Job'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _websiteController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
}

