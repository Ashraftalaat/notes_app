import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //(brightness: Brightness.dark)هذه افضل من .dart فقط لانها بتغير في تكوين Theme
      theme: ThemeData(brightness: Brightness.dark),
      home: const NotesView(),
    );
  }
}
