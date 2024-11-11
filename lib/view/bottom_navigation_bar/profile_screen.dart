import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Profile_Screen'),
        leading: InkWell(
            onTap: () {
              Get.back();
            } ,
            child: const Icon(Icons.keyboard_backspace)),
        centerTitle: true,
      ),
      body: const Center(child: Text('Profile_Screen', style: TextStyle(fontSize: 30, color: Colors.blue),)),
    );
  }
}