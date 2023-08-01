import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved});

  final String hint;
  final int maxLines;
//مش هتكون required
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        //منحطش علامة تعجب! لانه اكيد مش فاضي احنا بنعمل تشيك  فنضع ؟
        //?? يعني بيشوف القيمة اللي قبليها لو null يبقي خد اللي بعديها true برده
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      //لون مؤشر الكتابة
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        //شكل البوردر في حالة ظهوره بدون الضغط علية
        enabledBorder: buildBorder(),
        //في حالة الضغط علية
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

//   الشكل العام للborder
  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        //لو كانت "null"استخدم اللون الابيض
        color: Color ?? Colors.white,
      ),
    );
  }
}
