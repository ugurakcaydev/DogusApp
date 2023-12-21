import 'package:dogus_app/pages/login.dart';
import 'package:dogus_app/server/data/itemAcedemicCalendar.dart';
import 'package:dogus_app/server/data/itemQuickMenu.dart';
import 'package:dogus_app/theme/theme_provider.dart';
import 'package:dogus_app/widgets/announcements.dart';
import 'package:dogus_app/widgets/listview_academic_calendar.dart';
import 'package:dogus_app/widgets/listview_quickmenu.dart';
import 'package:dogus_app/widgets/text.dart';
import 'package:dogus_app/widgets/vertical_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background, //Colors.red[300],
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
                        // Navigator.pushNamed(context, "/login"); //böyle de kullanılabilir
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginPage()));
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed("/login");
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
                    Row(
                      children: [
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
                        GestureDetector(
                          onTap: () {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.sunny,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 350,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffC1121F),
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
                        image: DecorationImage(
                          image: AssetImage("images/PP.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Text(
                            "Muhammed Uğur Emre",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            "202103011020",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Text(
                            "MÜHENDİSLİK FAKÜLTESİ",
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          Text(
                            "YAZILIM MÜHENDİSLİĞİ",
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 1),
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
                          ColumnTextWidget(title: "AGNO", describe: "2,64"),
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
                  color: Color(0xffC1121F),
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
                                TextStyle(fontSize: 14, color: Colors.black)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("4 °",
                                style: TextStyle(
                                    fontSize: 32, color: Colors.black)),
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
                                Text("Pazar, 17 Aralık",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.key,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Ümraniye",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
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
                        color: Colors.yellow[400],
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
