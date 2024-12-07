import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Receive the student data as constructor arguments
  final Map<String, String> studentData;

  ProfilePage({required this.studentData});

  void _showQRCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("QR Code"),
          content: Image.asset(
            studentData['qrImage']!, // Dynamically fetch QR image path
            fit: BoxFit.contain,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.orange.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Navigation Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (String value) {
                        // Handle menu item selection
                        print('Selected: $value');
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: "Option 1",
                            child: Text("Option 1"),
                          ),
                          PopupMenuItem<String>(
                            value: "Option 2",
                            child: Text("Option 2"),
                          ),
                        ];
                      },
                      icon: Icon(Icons.more_vert, color: Colors.black),
                    ),
                  ],
                ),
                // Profile Info (Name, Title) - Not in the white border
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 32, // Avatar size
                      backgroundImage: AssetImage(studentData['image']!),
                    ),
                    SizedBox(width: 12), // Space between avatar and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            studentData['name']!,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Student",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 16.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              studentData['description']!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sticky Bottom Icon with QR Code
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.qr_code, color: Colors.black, size: 24),
                    onPressed: () {
                      _showQRCodeDialog(context); // Show the QR image for the specific student
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
