import 'package:flutter/material.dart';
import 'package:learn_getx/untils/constant.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final String textBtn;
  final Color? colorBtn;
  final VoidCallback onTab;
  const CustomButton({super.key, required this.size, required this.textBtn, this.colorBtn, required this.onTab});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          width: size.width/2,
          height: 48,
          decoration: BoxDecoration(
            color: colorBtn ?? Colors.cyan,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(textBtn, style: kContentStyle,),
        ),
      ),
    );
  }
}
