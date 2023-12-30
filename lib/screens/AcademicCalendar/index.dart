import 'package:dogus_app/const/customScroll.dart';
import 'package:dogus_app/server/data/itemAcedemicCalendar.dart';
import 'package:flutter/material.dart';

class AcademicCalendar extends StatelessWidget {
  final List<ItemAcademicCalendar> academicCalendarItems;
  const AcademicCalendar({required this.academicCalendarItems});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[700],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Akademik Takvim",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 76,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 0),
                      child: ScrollConfiguration(
                        behavior: MyCustomScrollBehavior(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                runSpacing: 15,
                                children: academicCalendarItems.map((item) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                        ),
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 300,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[800],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                item
                                                    .title, // item.title'ı buraya ekledik
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    item
                                                        .startingdate, // item.startingdate'yi buraya ekledik
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white)),
                                                SizedBox(width: 5),
                                                Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                    item
                                                        .endingdate, // item.endingdate'yi buraya ekledik
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
