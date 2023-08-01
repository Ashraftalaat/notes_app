import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

//دة بنستخدمه لنظهر له ايرور في حالة دخل input خطا
//سواء مدخلش حاجة او دخل حاجة مش عايزنها
  //او نسي مثلا @ او"." في الايميل
  //وبالتالي لازم تكون StatefulWidget
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

// لو هننشئ متغير مش finalيفضل يكون داخل StatefulWidget
//اما في StatelessWidget يفضل نحط finalلانه مبيتغيرش "immutable"
//ولو اتحطت هنشيل const فيه
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    //عشان نشغل الحالة اللي عليها الفورم ونحفظ الداتا
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'contaent',
            maxLines: 5,
          ),
          //Spacer(),//ما ينفعش نستخدمها داخل  SingleChildScrollView
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onTap: () {
              //!متاكدين انها مش ب null
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                //يستمر يعمل validate
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
