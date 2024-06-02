import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kormobarta/screen/jobpost.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Profile'),
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

// class JobPostingScreen extends StatefulWidget {
//   @override
//   _JobPostingScreenState createState() => _JobPostingScreenState();
// }

// class _JobPostingScreenState extends State<JobPostingScreen> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _locationController = TextEditingController();
//   TextEditingController _websiteController = TextEditingController();
//   TextEditingController _startDateController = TextEditingController();
//   TextEditingController _endDateController = TextEditingController();
//   late String _imagePath;

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedImage != null) {
//         _imagePath = pickedImage.path;
//       }
//     });
//   }

//   // void _copyToClipboard() {
//   //   String jobDetails =
//   //       "Job Title: ${_titleController.text}\nDescription: ${_descriptionController.text}\nLocation: ${_locationController.text}\nOfficial Website: ${_websiteController.text}\nStart Date: ${_startDateController.text}\nEnd Date: ${_endDateController.text}\nImage Path: $_imagePath";
//   //   Clipboard.setData(ClipboardData(text: jobDetails));
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     const SnackBar(content: Text('Job details copied to clipboard')),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Post a Job'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // if (_imagePath != null)
//             //   Image.file(
//             //     File(_imagePath),
//             //     height: 200,
//             //     width: 200,
//             //     fit: BoxFit.cover,
//             //   ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: const Text('Select Image'),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Job Title'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Job Description'),
//               maxLines: null,
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _locationController,
//               decoration: const InputDecoration(labelText: 'Job Location'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _websiteController,
//               decoration: const InputDecoration(labelText: 'Official Website'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _startDateController,
//               decoration: const InputDecoration(labelText: 'Job Start Date'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _endDateController,
//               decoration: const InputDecoration(labelText: 'Job End Date'),
//             ),
//             const SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: _copyToClipboard,
//             //   child: const Text('Copy Job Details to Clipboard'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     _locationController.dispose();
//     _websiteController.dispose();
//     _startDateController.dispose();
//     _endDateController.dispose();
//     super.dispose();
//   }
// }
