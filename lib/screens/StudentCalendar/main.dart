// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class StudentCalendar extends StatefulWidget {
//   const StudentCalendar({Key? key}) : super(key: key);

//   @override
//   _StudentCalendarState createState() => _StudentCalendarState();
// }

// class _StudentCalendarState extends State<StudentCalendar> {
//   late DateTime _selectedDate;
//   late List<Map<String, dynamic>> _examData;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = DateTime.now();
//     _examData = [
//       {"date": "2023-03-15", "subject": "Math", "grade": "A"},
//       {"date": "2023-03-20", "subject": "History", "grade": "B"},
//       {"date": "2023-03-25", "subject": "Science", "grade": "C"},
//       // Ek sınavlar eklenebilir
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Student Calendar"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildMonthPicker(),
//             _buildCalendar(),
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("images/Dogus_universitesi_logo.png"),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.2),
//                     BlendMode.dstATop,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMonthPicker() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: () {
//             setState(() {
//               _selectedDate =
//                   DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
//             });
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//         Text(
//           DateFormat('MMMM yyyy').format(_selectedDate),
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         IconButton(
//           onPressed: () {
//             setState(() {
//               _selectedDate =
//                   DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
//             });
//           },
//           icon: Icon(Icons.arrow_forward),
//         ),
//       ],
//     );
//   }

//   Widget _buildCalendar() {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double gridItemWidth = (screenWidth - 32 - 30) / 3; // Adjusted for margins

//     List<Widget> calendarItems = [];

//     for (int i = 1;
//         i <= DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
//         i++) {
//       DateTime currentDate =
//           DateTime(_selectedDate.year, _selectedDate.month, i);
//       List<Map<String, dynamic>> examsForCurrentDate =
//           _getExamsForDate(currentDate);

//       calendarItems.add(
//         GestureDetector(
//           onTap: () {
//             showExamDetails(examsForCurrentDate);
//           },
//           child: Card(
//             margin: EdgeInsets.all(15),
//             elevation: 5, // Elevation for shadow
//             child: Container(
//               width: gridItemWidth,
//               decoration: BoxDecoration(
//                 color: _isToday(currentDate) ? Colors.green : Colors.white,
//                 borderRadius: BorderRadius.circular(3.0),
//                 border: Border.all(
//                   color: Colors.black,
//                   width: 2.0,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: _isToday(currentDate) ? Colors.black : Colors.grey,
//                     spreadRadius: 6,
//                     blurRadius: 15,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     color: Colors.red, // Red color for the top part
//                     height: 13,
//                   ),
//                   SizedBox(height: 1),
//                   Text(
//                     DateFormat('d').format(currentDate),
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 1),
//                   Text(
//                     DateFormat('E').format(currentDate),
//                     style: TextStyle(fontSize: 8, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }

//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//       ),
//       itemCount: calendarItems.length,
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) {
//         return calendarItems[index];
//       },
//     );
//   }

//   List<Map<String, dynamic>> _getExamsForDate(DateTime date) {
//     return _examData
//         .where((exam) => DateTime.parse(exam['date']).day == date.day)
//         .toList();
//   }

//   bool _isToday(DateTime date) {
//     DateTime now = DateTime.now();
//     return date.year == now.year &&
//         date.month == now.month &&
//         date.day == now.day;
//   }

//   void showExamDetails(List<Map<String, dynamic>> exams) {
//     if (exams.isNotEmpty) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Exams"),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: exams.map((exam) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('${exam['subject']} - Grade: ${exam['grade']}'),
//                     SizedBox(height: 4),
//                   ],
//                 );
//               }).toList(),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Close'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }

//   //  GestureDetector(
//   //               onTap: () {
//   //                 Navigator.pop(context);
//   //               },
//   //               child: Container(
//   //                   width: 100,
//   //                   height: 100,
//   //                   color: Colors.black26,
//   //                   child: Text("Tıkla kapat")),
//   //             )
