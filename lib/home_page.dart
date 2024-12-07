import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> students = [
    {
      'name': 'Sanskar Satyal',
      'miniDescription': 'I am a student. I want to learn new things.',
      'description': '''
  Objective  
  A passionate and dedicated learner aiming to gain practical experience and make meaningful contributions to frontend development, while advancing technical expertise and knowledge.
    
  Education  
    - Reliance College  
      Bachelor's in Computer Application (BCA)  
      2020-Present  
    - Reliance International Academy (RIA)  
      School Leaving Certificate (SLC)  
      2018-2020  
    - Tri-Jyoti Higher Secondary School  
      Secondary Education Examination (SEE)  
      2018  
    
  Skills  
    - HTML, CSS, PHP, Laravel, MySQL, UI/UX
  ''',
      'image': 'lib/assets/images/student3.png',
      'qrImage': 'lib/assets/images/SanskarCv.png',
    },
    {
  'name': 'Shree Shrestha',
  'miniDescription': 'I want to learn new things',
  'description': '''
Objective  
An enthusiastic and committed learner striving to acquire hands-on experience and contribute effectively to frontend development, while continuously enhancing technical skills and knowledge.  

Education  
- Reliance College  
  Bachelor's in Computer Application (BCA)  
  2020-Present  

Skills  
- HTML, CSS, PHP, Laravel, React JS, JavaScript, Bootstrap
  ''',
  'image': 'lib/assets/images/student1.png',
  'qrImage': 'lib/assets/images/ShreeCv.png',
},

    {
      'name': 'Nemo Tamang',
      'miniDescription': 'I am student studing in Reliance Collage',
      'description': '''
Objective:
A highly motivated and enthusiastic student seeking to gain valuable experience and contribute to frontend development while continuing to develop skills and knowledge.

Education:
Reliance College
BCA
2020 - 2025

Skills:
Programming Skills: Basic Python Programming, JavaScript, basic React and PHP.
Soft Skills: Good with vocal and written communication and teamwork.
  ''',
      'image': 'lib/assets/images/student5.png',
      'qrImage': 'lib/assets/images/NemoCv.png',
    },
    {
      'name': 'Sanjaya Tamang',
      'miniDescription': 'I am Sanjay Tamang. I live in Kapan Kathmandu',
      'description': '''Objective:
 A motivated and enthusiastic student seeking to gain valuable experience and contribute to backend while continuing to develop skills and knowledge.
Education:
- Reliance College  
  Bachelor's in Computer Application (BCA)  
  2020-Present  
- Reliance International Academy (RIA)  
  School Leaving Certificate (SLC)  
  2018-2020  
- Nava Manjushree Secondary School  
  Secondary Education Examination (SEE)  
  2018  

Skills:
- HTML,CSS,JS,Python,Django,SQL,React JS''',
      'image': 'lib/assets/images/student4.png',
      'qrImage': 'lib/assets/images/SanjayCv.png',
    },
    {
      'name': 'Pranish Lama',
      'miniDescription': 'I am Pranish Lama',
      'description': '''
  Objective  
    A passionate tech enthusiast with a moderate foundation in programming and hands-on experience in software development and website design. I have a keen interest in exploring different software while gaining experience and knowledge.

  Education  
    +2 Reliance College/Kathmandu - February 2018 - March 2020  
    Bachelor's in Computer Application (BCA) - Reliance College/Kathmandu - October 2020 - Present

  Skills  
    Python - Skillful  
    PHP - Beginner  
    React.js - Novice
  ''',
      'image': 'lib/assets/images/student2.png',
      'qrImage': 'lib/assets/images/PranishCv.png',
    },
    {
      'name': 'Bhishma Rai',
      'miniDescription': 'I am a student',
      'description': '''
Objective  
 A highly motivated and enthusiastic student seeking to gain valuable experience and contribute to backend development while continuing to develop skills and knowledge.
    
Education  
 - Reliance College  
   Bachelor's in Computer Application (BCA)  
   2020 - 2025
    
Skills  
 Programming Skills: Basic Python,JavaScript,PHP,Flask
 Soft Skills: Good with vocal and written  communication and teamwork.
  ''',
      'image': 'lib/assets/images/student6.png',
      'qrImage': 'lib/assets/images/BhishmaCv.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF7EC1DD),
                  Color(0xFFEB9571)
                ], // App Theme Colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              // Top Navigation Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Gradient Text "Rapp"
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 52, 77, 74),
                          Color(0xFFEB9571)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        "Rapp",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Gradient applies here
                        ),
                      ),
                    ),
                    Text(
                      "Team Member",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Student Grid with Scrollable Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Show 2 students per row
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio:
                          188 / 310, // Aspect ratio of each grid item
                    ),
                    itemCount: students.length, // Total number of students
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfilePage(studentData: student),
                            ),
                          );
                        },
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(36),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: Offset(2, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Avatar
                                  CircleAvatar(
                                    radius: constraints.maxWidth *
                                        0.3, // Responsive radius
                                    backgroundImage:
                                        AssetImage(student['image']!),
                                  ),
                                  SizedBox(
                                      height: constraints.maxHeight * 0.05),
                                  // Student Name
                                  Text(
                                    student['name']!,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.08,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                      height: constraints.maxHeight * 0.02),
                                  // Mini Description
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      student['miniDescription']!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.06,
                                        color: Colors.grey[700],
                                      ),
                                      maxLines:
                                          1, // Single line for mini description
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          // Bottom Navigation Bar
          Positioned(
            bottom: 20, // Lifted slightly above the bottom
            left: 0,
            right: 0,
            child: Container(
              height: 50, // Smaller height for the bottom bar
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle Home Button Press
                  },
                  child: Container(
                    padding:
                        EdgeInsets.all(6), // Add padding to fit the icon size
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple], // Gradient color
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // Stroke color
                        width: 2, // Small stroke width
                      ),
                    ),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30, // Icon size
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
