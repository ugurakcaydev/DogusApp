class ItemAcademicCalendar {
  final String title;
  final String date;

  ItemAcademicCalendar({
    required this.title,
    required this.date,
  });
}

List<ItemAcademicCalendar> academicCalendarItems = [
  ItemAcademicCalendar(
      title: "Ara Sınav Not Girişi", date: "13 Kasım - 27 Kasım"),
  ItemAcademicCalendar(
      title: "Ara Sınav Notlarının Öğrenciye Yayınlanması", date: "27 Kasım"),
];
