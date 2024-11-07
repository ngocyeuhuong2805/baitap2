import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/user_controller.dart';
import 'package:learn_getx/view/detail_page.dart';
import 'package:learn_getx/widget/dia_log_add_user.dart';
import '../untils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Bài tập buổi 2'),
      centerTitle: true,
      leading: InkWell(
        onTap: (){
          Get.back();
        },
          child: const Icon(Icons.keyboard_backspace)),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DiaLogAddUser(size: MediaQuery.of(context).size,);
                },
              );
            },
            icon: const Icon(Icons.add))
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              _buildListUser(context)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildListUser(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              itemCount: userController.listUser.length,
              itemBuilder: (context, index) {
                final user = userController.listUser[index];
                return Dismissible(
                  key: ValueKey(user),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      userController.deleteUser(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${user.name} has been deleted')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.to(() => DetailPage(userModel: user));
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        IMAGE_URL2,
                        width: 50,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Name: ${user.name}',
                      style: kContent1Style,
                    ),
                    subtitle: Text(
                      'Age: ${user.job}',
                      style: kContent1Style,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
