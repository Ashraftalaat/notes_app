import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'views/notes_view.dart';

//ادخال Hive
void main() async {
  await Hive.initFlutter();
//هنخزن البيانات في box او كولكشن في المستقبل
//وبنقول لhive خزني بيانات من NoteModel
  await Hive.openBox(kNotesBox);
  //(1) بنعمل model
  //(2)بنعمل adapter لل model
  //(3)بنخزن modelAdapter في hive
  //بنقوله عايز اخزن NoteModelAdapter
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
          child: Container(),
        )
      ],
      child: MaterialApp(
        //لازال علامة debug
        debugShowCheckedModeBanner: false,
        //(brightness: Brightness.dark)هذه افضل من .dart فقط لانها بتغير في تكوين Theme
        theme: ThemeData(
          brightness: Brightness.dark,
          //الخط اللي هنستخدمه في التطبيق كله
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
