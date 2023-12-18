import 'package:flutter/material.dart';

class StudentCalendar extends StatelessWidget {
  const StudentCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Student cALENDAR"),
        // ),
        body: Container(
          child: Center(
              child: Row(
            children: [
              Text("student calendar"),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black26,
                    child: Text("Tıkla kapat")),
              )
            ],
          )),
        ),
      ),
    );
  }
}
