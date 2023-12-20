import 'package:flutter/material.dart';

class MyLessons extends StatefulWidget {
  const MyLessons({Key? key}) : super(key: key);

  @override
  _MyLessonsState createState() => _MyLessonsState();
}

class _MyLessonsState extends State<MyLessons> {
  List<Map<String, dynamic>> dummyData = [
    {
      'lessonCode': 'CS101',
      'lessonName': 'Introduction to Computer Science',
      'instructor': 'Prof. John Doe',
      'branch': 'A',
      'grade': 'A+',
      'akts': 3,
      'credit': 5,
      'details': 'This is an introductory course to computer science.',
    },
    {
      'lessonCode': 'MATH202',
      'lessonName': 'Advanced Mathematics',
      'instructor': 'Dr. Jane Smith',
      'branch': 'B',
      'grade': 'B',
      'akts': 4,
      'credit': 6,
      'details': 'This course covers advanced mathematical topics.',
    },
  ]; // Diğer dersler ]

  int? selectedLessonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alınan Dersler'),
        backgroundColor: Color(0xffc1121f),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.red[300],
        child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            var lesson = dummyData[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedLessonIndex =
                      selectedLessonIndex == index ? null : index;
                  Navigator.of(context, rootNavigator: true);
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
                      selectedLessonIndex == index ? 0 : 16),
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
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('images/mitatuysal.jpg'),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${lesson['lessonCode']} - ${lesson['lessonName']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Divider(
                            color: Colors.black87,
                            height: 15,
                          ), // Yatay çizgi ekleniyor
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text('Hoca: ${lesson['instructor']}'),
                          Divider(color: Colors.black54, height: 5),
                          Text('Şube: ${lesson['branch']}'),
                          Divider(color: Colors.black54, height: 5),
                          Text('Not: ${lesson['grade']}'),
                          Divider(color: Colors.black54, height: 5),
                          Text('AKTS: ${lesson['akts']}'),
                          Divider(color: Colors.black54, height: 5),
                          Text('Kredi: ${lesson['credit']}'),
                          Divider(color: Colors.black54, height: 5),
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
                            Text(
                              'Ek Bilgiler:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(lesson['details'] ?? ''),
                          ],
                        ),
                      ),
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
