import "package:dogus_app/navbar/navbar.dart";
// import 'package:dogus_app/pages/quickmenu.dart';
import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/login.dart';
import 'package:dogus_app/pages/mylessons.dart';
import 'package:dogus_app/pages/notification.dart';
import 'package:dogus_app/pages/StudentProgram.dart';
import 'package:dogus_app/screens/AcademicCalendar/index.dart';
import "package:dogus_app/screens/StudentCalendar/calendar.dart";
import 'package:dogus_app/server/data/itemAcedemicCalendar.dart';
import 'package:dogus_app/screens/classAttendance/ClassAttendance.dart';
import 'package:dogus_app/screens/SemesterAverages/index.dart';
import "package:get/get.dart";

class AppPage {
  static String navbar = "/";
  static String login = "/login";
  static String home = "/home";
  static String classAttendance = "/classattendance";
  static String mylessons = "/mylessons";
  static String studentprogram = "/studentprogram";
  static String notificationspage = "/notificationspage";
  static String studentcalendar = "/studentcalendar";
  static String academiccalendar = "/academiccalendar";
  static String semesteraverages = "/semesteraverages";

  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const Navbar()),
    GetPage(name: classAttendance, page: () => const ClassAttendance()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: mylessons, page: () => const MyLessons()),
    GetPage(name: studentprogram, page: () => const StudentProgram()),
    GetPage(name: notificationspage, page: () => const NotificationsPage()),
    GetPage(name: studentcalendar, page: () => const StudentCalendar()),
    GetPage(
        name: academiccalendar,
        page: () =>
            AcademicCalendar(academicCalendarItems: academicCalendarItems)),
    GetPage(name: semesteraverages, page: () => const SemesterAverages()),
  ];

  static getnavbar() => navbar;
  static getclassattendance() => classAttendance;
  static getlogin() => login;
  static gethome() => home;
  static getmylessons() => mylessons;
  static getstudentprogram() => studentprogram;
  static getnotificationspage() => notificationspage;
  static getstudentcalendar() => studentcalendar;
  static getacademiccalendar() => academiccalendar;
  static getsemesteraverages() => semesteraverages;
}
