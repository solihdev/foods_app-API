import 'package:flutter/material.dart';
import 'package:foods_app_api/utils/color.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String word;

  const TextfieldWidget(
      {super.key, required this.word, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: textController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) => value != null && value.length < 2
            ? "Please enter at least 3 characters!"
            : null),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 12),
          hintText: word,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          helperStyle: const TextStyle(color: Colors.black26),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
              color: MyColors.C_70B9BE,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
              color: MyColors.C_70B9BE,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
              color: MyColors.C_70B9BE,
            ),
          ),
        ),
      ),
    );
  }
}

var maskFormatter = MaskTextInputFormatter(
  mask: '###-###',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

class TextfieldWidgetByCalories extends StatelessWidget {
  final TextEditingController textController;
  final String word;

  const TextfieldWidgetByCalories(
      {super.key, required this.word, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        inputFormatters: [maskFormatter],
        keyboardType: TextInputType.number,
        controller: textController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) => value != null && value.length < 6
            ? "Please enter at least 6 characters!"
            : null),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 12),
          hintText: word,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          helperStyle: const TextStyle(color: Colors.black26),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
              color: MyColors.C_70B9BE,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
              color: MyColors.C_70B9BE,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 1,
              color: MyColors.C_70B9BE,
            ),
          ),
        ),
      ),
    );
  }
}
