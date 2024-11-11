import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/widget/dia_log_add_user.dart';
import '../../untils/constant.dart';


class ListItem {
  String name;
  bool isChecked;
  String? activity;

  ListItem({required this.name, this.isChecked = false, this.activity});
}

class Home1Screen extends StatefulWidget {
  const Home1Screen({super.key});

  @override
  State<Home1Screen> createState() => _Home1ScreenState();
}

class _Home1ScreenState extends State<Home1Screen> {
  final TextEditingController name = TextEditingController();
  final List<ListItem> listName = [];
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text(TITLE_HOME, style: TextStyle(fontSize: 20),),
        leading: InkWell(
          onTap: () {
            Get.back();
            Get.snackbar(
              'Back Completed',
              'Going back!',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.black87,
              colorText: Colors.white,
              duration: const Duration(seconds: 2),
            );
          },
          child: const Icon(Icons.keyboard_backspace),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Switch(

                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(controller: name, hintText: ADD_NAME,),
              ),
            ],
          ),
          ElevatedButton(

            onPressed: () {
              setState(() {
                if (name.text.isNotEmpty) {
                  listName.add(ListItem(name: name.text));
                  name.clear();
                }
              });
            },
            child: const Text('Add'),
          ),
          if (listName.isNotEmpty)
            Expanded(

              child: ListView.builder(
                itemCount: listName.length,
                itemBuilder: (context, index) {
                  final item = listName[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.name, style: TextStyle(color: isDarkMode ? Colors.white: Colors.black),),
                        Text(
                          item.isChecked
                              ? FINISH
                              : UNFINISH,
                          style: TextStyle(
                            color: item.isChecked
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Text(
                          item.activity ?? '',
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          title: Text("Checked", style: TextStyle(color: isDarkMode ? Colors.white: Colors.black),),
                          value: item.isChecked,
                          onChanged: (value) {
                            setState(() {
                              item.isChecked = value!;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: LISTEN,
                              groupValue: item.activity,
                              onChanged: (value) {
                                setState(() {
                                  item.activity = value;
                                });
                              },
                            ),
                             Text(LISTEN, style: TextStyle(color: isDarkMode ? Colors.white: Colors.black)),
                            Radio<String>(
                              value: MOVIE,
                              groupValue: item.activity,
                              onChanged: (value) {
                                setState(() {
                                  item.activity = value;
                                });
                              },
                            ),
                             Text(MOVIE, style: TextStyle(color: isDarkMode ? Colors.white: Colors.black)),
                          ],
                        ),
                      ],
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