import 'package:flutter/material.dart';
import 'package:dogus_app/widgets/custom_button.dart';

class StudentProgram extends StatefulWidget {
  const StudentProgram({Key? key}) : super(key: key);

  @override
  _StudentProgramState createState() => _StudentProgramState();
}

class _StudentProgramState extends State<StudentProgram> {
  int selectedDayIndex = 0;
  List<List<Map<String, String>>> lessonData = [
    [
      {
        "lesson": "Mühendisler İçin KatıHal Fiziği",
        "code": "FİZ 371(1)",
        "time": "16:00-16.50",
        "location": "D.B2-01"
      },
      {
        "lesson": "Mühendisler İçin KatıHal Fiziği",
        "code": "FİZ 371(1)",
        "time": "17:00-17.50",
        "location": "D.B2-01"
      },
      {
        "lesson": "Mühendislikte Etik Ve İş Güvenliği",
        "code": "MF403-(2)",
        "time": "18:00-18:50",
        "location": "D.B2-13"
      },
      {
        "lesson": "Mühendislikte Etik Ve İş Güvenliği",
        "code": "MF403-(2)",
        "time": "19:00-19:50",
        "location": "D.B2-13"
      },
    ],
    // Pazartesi
    [
      {
        "lesson": "Yazılım Tasarımı ve Mimarisi",
        "code": "YM 341-(1)",
        "time": "09:00-09:50",
        "location": "D.B2-15",
      },
      {
        "lesson": "Yazılım Tasarımı ve Mimarisi",
        "code": "YM 341-(1)",
        "time": "10:00-10:50",
        "location": "D.B2-15",
      },
      {
        "lesson": "Yazılım Tasarımı ve Mimarisi",
        "code": "YM 341-(1)",
        "time": "15:00-15:50",
        "location": "D.B1-16-PC Lab",
      },
      {
        "lesson": "Yazılım Tasarımı ve Mimarisi",
        "code": "YM 341-(1)",
        "time": "16:00-16:50",
        "location": "D.B1-16-PC Lab",
      },
      {
        "lesson": "Bilgisayar Organizasyonu Ve Mimarisi",
        "code": "BİM 226-(1)",
        "time": "19:00-19:50",
        "location": "D.Online",
      },
      {
        "lesson": "Bilgisayar Organizasyonu Ve Mimarisi",
        "code": "BİM 226-(1)",
        "time": "20:00-20:50",
        "location": "D.Online",
      },
      {
        "lesson": "Bilgisayar Organizasyonu Ve Mimarisi",
        "code": "BİM 226-(1)",
        "time": "21:00-21:50",
        "location": "D.Online",
      },
      {
        "lesson": "Bilgisayar Organizasyonu Ve Mimarisi",
        "code": "BİM 226-(1)",
        "time": "22:00-22:50",
        "location": "D.Online",
      },
    ], //Salı
    [
      {
        "lesson": "İşletim Sistemleri",
        "code": "BİM 361-(1)",
        "time": "11:00-11:50",
        "location": "D.213",
      },
      {
        "lesson": "İşletim Sistemleri",
        "code": "BİM 361-(1)",
        "time": "12:00-12:50",
        "location": "D.213",
      },
      {
        "lesson": "İşletim Sistemleri",
        "code": "BİM 361-(1)",
        "time": "13:00-13:50",
        "location": "D.B1-74-PC Lab",
      },
      {
        "lesson": "İşletim Sistemleri",
        "code": "BİM 361-(1)",
        "time": "14:00-14:50",
        "location": "D.B1-74-PC Lab",
      },
    ], //Çarşamba

    [], //Perşembe

    [
      {
        "lesson": "Algoritma Analizi",
        "code": "BİM 355-(1)",
        "time": "11:00-11:50",
        "location": "D.B1-18-PC Lab",
      },
      {
        "lesson": "Algoritma Analizi",
        "code": "BİM 355-(1)",
        "time": "12:00-12:50",
        "location": "D.B1-18-PC Lab",
      },
    ], //Cuma

    [
      {
        "lesson": "Algoritma Analizi",
        "code": "BİM 355-(1)",
        "time": "12:00-12:50",
        "location": "D.Online",
      },
      {
        "lesson": "Algoritma Analizi",
        "code": "BİM 355-(1)",
        "time": "13:00-13:50",
        "location": "D.Online",
      },
    ], //Cumartesi
  ];

  void showLessons(int dayIndex) {
    setState(() {
      selectedDayIndex = dayIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    showLessons(selectedDayIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ders Programı',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: Text(
                        'Bildirilen ders saatleri değişiklik gösterebilir.',
                      ),
                    ),
                  ),
                  Center(child: CustomButton(onButtonPressed: showLessons)),
                  if (selectedDayIndex != -1)
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text(
                              ' ${getDayName(selectedDayIndex)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 15),
                          child: SingleChildScrollView(
                            child: Column(
                              children: lessonData[selectedDayIndex]
                                  .map((lessonInfo) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  lessonInfo["lesson"] ?? "",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${lessonInfo["code"] ?? ""}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "${lessonInfo["location"] ?? ""}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            lessonInfo["time"] ?? "",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getDayName(int dayIndex) {
    List<String> dayNames = [
      "Pazartesi",
      "Salı",
      "Çarşamba",
      "Perşembe",
      "Cuma",
      "Cumartesi"
    ];
    return dayNames[dayIndex];
  }
}
