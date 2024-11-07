import 'package:flutter/material.dart';
import 'package:learn_getx/untils/constant.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller, this.hintText, this.labelText,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: hintText,
            hintText: labelText,
            hintStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12
            ),
            contentPadding: const EdgeInsets.all(5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black
                )
            )
        ),
        style: kContentStyle,

      ),
    );
  }
}