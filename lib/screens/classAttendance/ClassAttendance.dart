import 'package:flutter/material.dart';

class ClassAttendance extends StatefulWidget {
  const ClassAttendance({Key? key}) : super(key: key);

  @override
  _ClassAttendanceState createState() => _ClassAttendanceState();
}

class _ClassAttendanceState extends State<ClassAttendance> {
  // Example list of classes with attendance status
  List<Map<String, dynamic>> classes = [
    {
      'code': 'BİM 355',
      'name': 'Algoritma Analizi',
      'attendance': true,
      'weeks': 14,
      'attendanceRate': 30,
      'department': 'Yazılım Mühendisliği',
      'akts': 5,
      'credit': 3,
      'hours1': '56 Saat',
      'hours2': '17 Saat',
    },
    {
      'code': 'FİZ 371',
      'name': 'Mühendisler İçin Katıhal Fiziği',
      'attendance': true,
      'weeks': 14,
      'attendanceRate': 30,
      'department': 'Elektirik-Elektronik Mühendisliği',
      'akts': 6,
      'credit': 3,
      'hours1': '42 Saat',
      'hours2': '13 Saat',
    },
    {
      'code': 'BİM 361',
      'name': 'İşletim Sistemleri',
      'attendance': true,
      'weeks': 14,
      'attendanceRate': 30,
      'department': 'Yazılım Mühendisliği',
      'akts': 6,
      'credit': 3,
      'hours1': '56 Saat',
      'hours2': '17 Saat',
    },
    {
      'code': 'BİM 226',
      'name': 'Bilgisayar Organizasyonu Ve Mimarisi',
      'attendance': true,
      'weeks': 14,
      'attendanceRate': 30,
      'department': 'Yazılım Mühendisliği',
      'akts': 5,
      'credit': 3,
      'hours1': '56 Saat',
      'hours2': '17 Saat',
    },
    {
      'code': 'MF 403',
      'name': 'Mühendislikte Etik Ve İş Güvenliği',
      'attendance': true,
      'weeks': 14,
      'attendanceRate': 30,
      'department': 'Elektirik-Elektronik Mühendisliği',
      'akts': 1,
      'credit': 1,
      'hours1': '28 Saat',
      'hours2': '8 Saat',
    },
    {
      'code': 'YM 341',
      'name': 'Yazılım Tasarımı Ve Mimarisi',
      'attendance': true,
      'weeks': 14,
      'attendanceRate': 30,
      'department': 'Yazılım Mühendisliği',
      'akts': 5,
      'credit': 3,
      'hours1': '56 Saat',
      'hours2': '17 Saat',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Devamsızlık Durumu',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: classes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 25.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${classes[index]['name']} ',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                Text(' ${classes[index]['code']}'),
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            Text(
                              'Toplam ${classes[index]['weeks']} Hafta (${classes[index]['hours1']})',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            Text(
                              'Devamsızlık Oranı ${classes[index]['attendanceRate']}% (${classes[index]['hours2']})',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            Text(
                              '${classes[index]['department']}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'AKTS: ${classes[index]['akts']}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                Text(
                                  'Kredi: ${classes[index]['credit']}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
