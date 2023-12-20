import 'package:flutter/material.dart';

class ClassAttendance extends StatefulWidget {
  const ClassAttendance({Key? key}) : super(key: key);

  @override
  _ClassAttendanceState createState() => _ClassAttendanceState();
}

class _ClassAttendanceState extends State<ClassAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devamsızlık Durumu"),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffc1121f),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView(),
          ),
        ),
      ]),
    );
  }
}
