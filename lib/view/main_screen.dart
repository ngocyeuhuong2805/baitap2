import 'package:flutter/material.dart';
import 'package:learn_getx/view/contacts_management_screen.dart';
import 'package:learn_getx/view/home_screen.dart';
import 'package:learn_getx/view/list_product_screen.dart';
import 'package:learn_getx/view/wearther_screen.dart';
import 'package:learn_getx/widget/custom_button.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập buổi 2'),
        centerTitle: true,
        leading: const Icon(Icons.account_box_outlined),
      ),
      body: Center(
        child: Column(
          children: [
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 123', onTab: () { Get.to(() => const HomeScreen());  },),
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 4', onTab: () { Get.to(() => const ListProductScreen()); },),
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 123', onTab: () { Get.to(() => const WeatherScreen());  },),
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 123', onTab: () { Get.to(() => const ContactsManagementScreen());  },),
          ],
        ),
      ),

    );
  }
}
