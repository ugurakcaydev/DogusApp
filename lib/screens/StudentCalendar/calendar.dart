import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentCalendar extends StatefulWidget {
  const StudentCalendar({Key? key}) : super(key: key);

  @override
  _StudentCalendarState createState() => _StudentCalendarState();
}

class _StudentCalendarState extends State<StudentCalendar> {
  late DateTime selectedDate;
  List<DateTime> examDates = [DateTime(2023, 12, 15), DateTime(2023, 12, 20)];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          "Takvim",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: YearlyCalendar(selectedDate: selectedDate, examDates: examDates),
    );
  }
}

class YearlyCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final List<DateTime> examDates;

  const YearlyCalendar({
    Key? key,
    required this.selectedDate,
    required this.examDates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Her satıra 2 eleman yerleştir
      ),
      itemCount: 12,
      shrinkWrap: true, // Yalnızca içeriği kadar alan kapla
      itemBuilder: (context, index) {
        final month = index + 1;
        final firstDayOfMonth = DateTime(selectedDate.year, month, 1);
        final daysInMonth = getDaysInMonth(firstDayOfMonth);

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MonthlyCalendar(
                  selectedMonth: month,
                  selectedDate: selectedDate,
                  daysInMonth: daysInMonth,
                  examDates: examDates,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color:
                      selectedDate.month == month ? Color(0xFFFD00F0F) : null,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  child: Text(
                    DateFormat.MMM('tr_TR').format(firstDayOfMonth),
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedDate.month == month
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: daysInMonth,
                    itemBuilder: (context, dayIndex) {
                      final currentDate =
                          DateTime(selectedDate.year, month, dayIndex + 1);
                      return Center(
                        child: Text(
                          (dayIndex + 1).toString(),
                          style: TextStyle(
                            fontSize: 14,
                            decoration: examDates.contains(currentDate)
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }
}

class MonthlyCalendar extends StatefulWidget {
  final int selectedMonth;
  final DateTime selectedDate;
  final int daysInMonth;
  final List<DateTime> examDates;

  const MonthlyCalendar({
    Key? key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.daysInMonth,
    required this.examDates,
  }) : super(key: key);

  @override
  _MonthlyCalendarState createState() => _MonthlyCalendarState();
}

class _MonthlyCalendarState extends State<MonthlyCalendar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(widget.selectedDate.year, widget.selectedMonth, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              DateFormat('MMMM yyyy', 'tr_TR').format(_selectedDate),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: MonthlyView(
        selectedDate: _selectedDate,
        daysInMonth: widget.daysInMonth,
        examDates: widget.examDates,
      ),
    );
  }
}

class MonthlyView extends StatelessWidget {
  final DateTime selectedDate;
  final int daysInMonth;
  final List<DateTime> examDates;

  const MonthlyView({
    Key? key,
    required this.selectedDate,
    required this.daysInMonth,
    required this.examDates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: daysOfWeek.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    daysOfWeek[index],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFD00F0F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0.1,
                  blurRadius: 7,
                  offset: const Offset(0, 7.75),
                ),
              ],
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: daysInMonth + getIndexOfFirstDayInMonth(selectedDate),
              itemBuilder: (BuildContext context, int index) {
                final dayOfMonth =
                    index + 1 - getIndexOfFirstDayInMonth(selectedDate);
                final currentDate =
                    DateTime(selectedDate.year, selectedDate.month, dayOfMonth);
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      showExamDetails(context, currentDate);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: examDates.contains(currentDate)
                            ? Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: index < getIndexOfFirstDayInMonth(selectedDate)
                          ? const Text("")
                          : Text(
                              '$dayOfMonth',
                              style: TextStyle(
                                color: examDates.contains(currentDate)
                                    ? Colors.white
                                    : index % 7 == 6
                                        ? Colors.redAccent
                                        : Colors.black,
                                fontSize: 21,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: Image.asset(
                  'images/Dogus_universitesi_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                "Bugün etkinlik yok",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getIndexOfFirstDayInMonth(DateTime currentDate) {
    var selectedMonthFirstDay =
        DateTime(currentDate.year, currentDate.month, 1);
    var day = selectedMonthFirstDay.weekday - 1;

    return day < 0 ? 6 : day;
  }

  void showExamDetails(BuildContext context, DateTime date) {
    if (examDates.contains(date)) {
      // Sınav detaylarını içeren bir bottom sheet göster
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('d MMMM yyyy', 'tr_TR').format(date),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Sınav Detayları:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Sınav konuları ve diğer bilgiler burada yer alacak.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                // Yeni eklenen sınav detayları
                Text(
                  "Sınav Saati: 09:00",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Kampüs: XYZ Kampüsü",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Sınıf: 301",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  static final List<String> daysOfWeek = [
    "Pzt",
    "Sal",
    "Çar",
    "Per",
    "Cum",
    "Cmt",
    "Paz",
  ];
}


//goksukucuker

//uguremre