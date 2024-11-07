import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learn_getx/controller/user_controller.dart';

import '../untils/constant.dart';

class DiaLogAddUser extends StatefulWidget {

   const DiaLogAddUser({super.key, required this.size});
  final Size size;

  @override
  State<DiaLogAddUser> createState() => _DiaLogAddUserState();
}

class _DiaLogAddUserState extends State<DiaLogAddUser> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController job = TextEditingController();
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: widget.size.width * 0.80,
          height: widget.size.height * 0.50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
      
          ),
      
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                        'https://img.pikbest.com/ai/illus_our/20230418/64e0e89c52dec903ce07bb1821b4bcc8.jpg!w700wp',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )),
              ),
              TextFieldWidget(controller: name, hintText: 'Nhập Name', labelText: 'Name', ),
              TextFieldWidget(controller: age, hintText: 'Nhập Age', labelText: 'Age'),
              TextFieldWidget(controller: job, hintText: 'Nhập Jobs', labelText: 'Jobs'),

              InkWell(
                onTap: (){
                   controller.addUser(
                       name.text,
                       IMAGE_URL,
                       age.text,
                       job.text);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  width: widget.size.width/3,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Add'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
