import 'package:flutter/material.dart';

class ClassAttendance extends StatefulWidget {
  const ClassAttendance({Key? key}) : super(key: key);

  @override
  _ClassAttendanceState createState() => _ClassAttendanceState();
}

class _ClassAttendanceState extends State<ClassAttendance> {
  // Example list of classes with attendance status
  List<Map<String, dynamic>> classes = [
    {'name': 'Math', 'attendance': true},
    {'name': 'English', 'attendance': false},
    // Add more classes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Devamsızlık Durumu"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffc1121f),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  itemCount: classes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(classes[index]['name']),
                      subtitle: Text(
                        classes[index]['attendance']
                            ? 'Devamsızlık Yok'
                            : 'Devamsızlık Var',
                        style: TextStyle(
                          color: classes[index]['attendance']
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      onTap: () {
                        // Handle class item click here
                        _showClassDetails(classes[index]['name']);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showClassDetails(String className) {
    // Implement your logic to show detailed view or perform other actions
    // For example, you can navigate to a new page with more details
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClassDetailsPage(className),
      ),
    );
  }
}

class ClassDetailsPage extends StatelessWidget {
  final String className;

  const ClassDetailsPage(this.className);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(className),
      ),
      body: Center(
        child: Text("Details for $className"),
      ),
    );
  }
}
