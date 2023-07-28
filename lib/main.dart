import 'package:flutter/material.dart';

import 'views/notes_view.dart';

void main() {
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
