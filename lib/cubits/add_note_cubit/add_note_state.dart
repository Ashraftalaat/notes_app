part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

//هناك في الاغلب ثوابت في state
//1//Loading عشان هيبقي في future
class AddNoteLoading extends AddNoteState {}

//2/Success عشان هيبقي فية عملية ناجحة
class AddNoteSuccess extends AddNoteState {}

//3/Failure عشان هيبقي فية عملية فاشلة
class AddNoteFailure extends AddNoteState {
  //هيكون فية رسالة الخطاء
  final String errMessage;

  AddNoteFailure(this.errMessage);
}
