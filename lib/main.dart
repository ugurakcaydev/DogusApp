import 'package:dogus_app/routes/routes.dart';
import 'package:dogus_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // Türkçe dil ayarını yapmak için initializeDateFormatting fonksiyonunu çağırın
  await initializeDateFormatting('tr_TR');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: AppPage.routes,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
