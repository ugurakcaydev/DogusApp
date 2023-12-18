
import 'package:dogus_app/server/data/itemAcedemicCalendar.dart';
import 'package:dogus_app/server/data/itemQuickMenu.dart';
import 'package:dogus_app/widgets/announcements.dart';
import 'package:dogus_app/widgets/listview_academic_calendar.dart';
import 'package:dogus_app/widgets/listview_quickmenu.dart';
import 'package:dogus_app/widgets/text.dart';
import 'package:dogus_app/widgets/vertical_line.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15, top: 15),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.exit_to_app,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/setting");
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 350,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Text(
                            "UĞUR AKÇAY",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "202103011043",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Text(
                            "MÜHENDİSLİK FAKÜLTESİ",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          Text(
                            "YAZILIM MÜHENDİSLİĞİ",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColumnTextWidget(
                              title: "Kayıt Tarihi", describe: "07.09.2021"),
                          VerticalLine(),
                          ColumnTextWidget(title: "Sınıf", describe: "3"),
                          VerticalLine(),
                          ColumnTextWidget(title: "ANO", describe: "0,00"),
                          VerticalLine(),
                          ColumnTextWidget(title: "AGNO", describe: "2,77"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12),
                width: 350,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 23),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("açık",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("17 °",
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white)),
                            SizedBox(
                              width: 8,
                            ),
                            VerticalLine(),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cumartesi, 02 Aralık",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.key,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Ümraniye",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.deepOrange[400],
                      ),
                    )
                  ],
                ),
              ),

              //HIZI MENU
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: ListViewQuickMenu(
                  title: "Hızlı Menü",
                  items: quickMenuItems,
                ),
              ),

              //AKADEMİK TAKVİM
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: ListviewAcademicCalendar(
                    title: "Akademik Takvim", items: academicCalendarItems),
              ),

              //DUYURULAR
              Announcements()
            ],
          ),
        ),
      ),
    );
  }
}
