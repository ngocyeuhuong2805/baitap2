import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Screen'),
        leading: InkWell(
            onTap: () {
              Get.back();
            } ,
            child: const Icon(Icons.keyboard_backspace)),
        centerTitle: true,
      ),
      body: const Center(child: Text('ContactScreen', style: TextStyle(fontSize: 30, color: Colors.blue),)),
    );
  }
}