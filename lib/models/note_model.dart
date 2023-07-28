import 'package:hive/hive.dart';

//اسم الفيل اللي هيتعمل له generate بلغة dart
part 'note_model.g.dart';

//يمكن في الكلاس تكرار الرقم
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
//لا يمكن تكرار الرقم
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
//بعد كدة هنفتح New terminal ونضع الامر دة
//flutter packages pub run build_runner build
