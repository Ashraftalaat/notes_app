import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';

import 'views/notes_view.dart';

//ادخال Hive
void main() async {
  await Hive.initFlutter();
//هنخزن البيانات في box او كولكشن في المستقبل
  await Hive.openBox(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //لازال علامة debug
      debugShowCheckedModeBanner: false,
      //(brightness: Brightness.dark)هذه افضل من .dart فقط لانها بتغير في تكوين Theme
      theme: ThemeData(
        brightness: Brightness.dark,
        //الخط اللي هنستخدمه في التطبيق كله
        fontFamily: 'Poppins',
      ),
      home: const NotesView(),
    );
  }
}
