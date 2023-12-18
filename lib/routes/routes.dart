import "package:dogus_app/navbar/navbar.dart";
import 'package:dogus_app/pages/quickmenu.dart';
import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/login.dart';
import "package:dogus_app/pages/AlinanDersler.dart";
import "package:dogus_app/pages/profile.dart";
import "package:dogus_app/pages/setting.dart";
import "package:dogus_app/screens/StudentCalendar/index.dart";
import "package:get/get.dart";

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const Navbar()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: home, page: () => const Home()),
    // GetPage(name: chart, page: () => const QuickMenu()),
    GetPage(name: alinanDersler, page: () => const AlinanDersler()),
    // GetPage(name: chart, page: () => const Chart()),
    GetPage(name: setting, page: () => const Setting()),
    GetPage(name: profile, page: () => const Profile()),
    GetPage(name: studentcalendar, page: () => const StudentCalendar()),
  ];
  //
  static getnavbar() => navbar;
  static getlogin() => login;
  static gethome() => home;
  // static getquickmenu() => quickmenu;
  static getAlinanDersler() => alinanDersler;
  // static getchart() => chart;
  static getsetting() => setting;
  static getprofile() => profile;
  static getstudentcalendar() => studentcalendar;

  //
  static String navbar = "/";
  static String login = "/login";
  static String home = "/home";
  // static String chart = "/quickmenu";
  static String alinanDersler = "/alinandersler";
  // static String chart = "/chart";
  static String setting = "/setting";
  static String profile = "/profile";
  static String studentcalendar = "/studentcalendar";
}
