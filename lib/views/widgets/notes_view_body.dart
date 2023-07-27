import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

import 'custom_app_bar.dart';

//عملنا body في widgetمنفصلة لتحسين الاداء
class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: CustomAppBar(),
          ),
          //عشان تتوزع علي كل المساحة للشاشة وميحصلش ايرور
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
