import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/untils/constant.dart';

import '../../widget/text_filed_widget.dart';
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final TextEditingController number1 = TextEditingController();
  final TextEditingController number2 = TextEditingController();
  int sum = 0;

  int tinhTong(int so1, int so2){
    sum = so1 + so2;
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Tính tổng 2 số'),
        leading: InkWell(
            onTap: () {
              Get.back();
            } ,
            child: const Icon(Icons.keyboard_backspace)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFieldWidget(controller: number1, hintText: 'Nhập số 1',),
          TextFieldWidget(controller: number2, hintText: 'Nhập số 2',),
          Padding(
            padding: const EdgeInsets.symmetric (horizontal: 16),
            child: Row(
              children: [
                ElevatedButton(

                  onPressed: () {
                    setState(() {
                      tinhTong(int.parse(number1.text),int.parse(number2.text));

                    });
                  },
                  child: const Text('Tổng: '),
                ),
                const SizedBox( width: 10,),
                Text('$sum', style: kText1Style,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}