import 'package:flutter/material.dart';
import 'package:untitled1/screen/addNote.dart';
import 'package:untitled1/screen/editNote.dart';
import 'package:untitled1/screen/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins",
      ),
      home: const homePage(),
      routes: {
        "home": (context) => const homePage(),
        "add": (context) => const addNote(),
        "edit": (context) => editNote(),
      },
    );
  }
}
