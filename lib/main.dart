import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
        ),
        scaffoldBackgroundColor: Colors.deepOrangeAccent,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
