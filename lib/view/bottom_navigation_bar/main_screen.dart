import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:learn_getx/untils/constant.dart';
import 'package:learn_getx/view/contacts_management_screen.dart';
import 'package:learn_getx/view/drawer_menu/contact_screen.dart';
import 'package:learn_getx/view/drawer_menu/gallery_screen.dart';
import 'package:learn_getx/view/drawer_menu/home1_screen.dart';
import 'package:learn_getx/view/home_screen.dart';
import 'package:learn_getx/view/list_product_screen.dart';
import 'package:learn_getx/view/wearther_screen.dart';
import 'package:learn_getx/widget/custom_button.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int count = 0;

  // void isolateSum () async {
  //   final receivePort = ReceivePort();
  //   await Isolate.spawn(caculateSum, receivePort.sendPort);
  //   receivePort.listen((data) {
  //     setState(() {
  //       count = data;
  //     });
  //     print('Tổng isolateSum: $data');
  //   });
  // }
  //
  // static void caculateSum(SendPort sendPort) {
  //   int sum = 0;
  //   for(int i = 1; i<= 1000000000; i++){
  //     sum += i;
  //   }
  //   sendPort.send(sum);
  // }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập buổi 2'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home1 Screen', style: kContentStyle,),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Home1Screen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.browse_gallery),
              title: const Text('Gallery Screen' , style: kContentStyle),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const GalleryScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Screen', style: kContentStyle),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ContactScreen()),
                );
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 123', onTab: () { Get.to(() => const HomeScreen());  },),
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 4', onTab: () { Get.to(() => const ListProductScreen()); },),
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 123', onTab: () { Get.to(() => const WeatherScreen());  },),
            CustomButton(size: MediaQuery.of(context).size, textBtn: 'Bài 123', onTab: () { Get.to(() => const ContactsManagementScreen());  },),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Đếm số : $count', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          count++;
        });
        // isolateSum();

      },
        child: const Icon(Icons.add),
      ),

    );
  }
}
