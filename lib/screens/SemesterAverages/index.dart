import 'package:dogus_app/screens/SemesterAverages/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SemesterAverages extends StatefulWidget {
  const SemesterAverages({Key? key}) : super(key: key);

  @override
  _SemesterAveragesState createState() => _SemesterAveragesState();
}

class _SemesterAveragesState extends State<SemesterAverages> {
  List<double> semesterAverages = [
    2.96,
    1.98,
    2.7,
    2.89,
    2.98,
    3.0,
    3.0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Semester Averages'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Genel Ortalama Kutucuğu
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genel Ortalama',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Genel Ortalamanız: 2.76', // Buraya genel ortalamayı ekleyin
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Grafik Kutucuğu
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 75, vertical: 20), // Dikey boşluk ekledik
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: MyBarGraph(
                  semesterAverages: semesterAverages,
                ),
              ),
            ),
            // Her Dönem Kutucukları
            Wrap(
              spacing: 50.0, // Yatay boşluk
              runSpacing: 50.0, // Dikey boşluk
              children: List.generate(
                semesterAverages.length,
                (index) => Container(
                  width:
                      MediaQuery.of(context).size.width / 2.5, // Genişlik ayarı
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(
                      vertical: 20), // Dikey boşluk ekledik
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dönem ${index + 1}', // Dönem numarasını ekleyin
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Genel Ortalama: ${semesterAverages[index]}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
