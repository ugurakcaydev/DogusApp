import 'package:flutter/material.dart';

class AlinanDersler extends StatefulWidget {
  const AlinanDersler({Key? key}) : super(key: key);

  @override
  _AlinanDerslerState createState() => _AlinanDerslerState();
}

class _AlinanDerslerState extends State<AlinanDersler> {
  List<Map<String, dynamic>> dummyData = [
    {
      "lessonName": "Matematik",
      "instructor": "Ahmet Hoca",
      "grade": "AA",
      "akts": 5,
      "credit": 3,
      "icon": Icons.school_sharp,
      "details": "Matematik dersi ile ilgili ek bilgiler burada yer alacak.",
    },
    {
      "lessonName": "Fizik",
      "instructor": "Ayşe Hoca",
      "grade": "BB",
      "akts": 4,
      "credit": 4,
      "icon": Icons.science_sharp,
      "details": "Fizik dersi ile ilgili ek bilgiler burada yer alacak.",
    },
    {
      "lessonName": "Biyoloji",
      "instructor": "Mehmet Hoca",
      "grade": "CC",
      "akts": 3,
      "credit": 4,
      "icon": Icons.local_florist_sharp,
      "details": "Biyoloji dersi ile ilgili ek bilgiler burada yer alacak.",
    },
    {
      "lessonName": "Kimya",
      "instructor": "Fatma Hoca",
      "grade": "BA",
      "akts": 4,
      "credit": 3,
      "icon": Icons.science_sharp,
      "details": "Kimya dersi ile ilgili ek bilgiler burada yer alacak.",
    },
    // Diğer dersler...
  ];

  int? selectedLessonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Dogus_universitesi_logo.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            var lesson = dummyData[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedLessonIndex == index) {
                    selectedLessonIndex = null;
                  } else {
                    selectedLessonIndex = index;
                  }
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(
                    selectedLessonIndex == index ? 0 : 16,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        lesson['icon'],
                        size: 40,
                        color: Colors.blue,
                      ),
                      title: Text(
                        lesson['lessonName']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text('Hoca: ${lesson['instructor']}'),
                          Text('Not: ${lesson['grade']}'),
                          Text('AKTS: ${lesson['akts']}'),
                          Text('Kredi: ${lesson['credit']}'),
                        ],
                      ),
                      tileColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    if (selectedLessonIndex == index)
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.all(12),
                        color: Colors.blue.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ek Bilgiler:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 8),
                            Text(lesson['details'] ?? ''),
                          ],
                        ),
                      ),
                    Divider(color: Colors.black),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
