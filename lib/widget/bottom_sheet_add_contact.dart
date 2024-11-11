import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_getx/controller/contact_controller.dart';
import 'package:learn_getx/untils/constant.dart';

class BottomSheetAddContact extends StatefulWidget {
  const BottomSheetAddContact({super.key});

  @override
  State<BottomSheetAddContact> createState() => _BottomSheetAddContactState();
}

class _BottomSheetAddContactState extends State<BottomSheetAddContact> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController addrees = TextEditingController();
  File? imageFile;
  final controller = Get.put(ContactController());

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          imageFile = File(image.path);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking image: $e');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        alignment: Alignment.topLeft,

        decoration: BoxDecoration(
          color: Colors.deepPurple[30],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Text(
                    'Hủy',
                    style: kButtonStyle,
                  ),

                ),
                const Text(
                  'Liên hệ mới',
                  style: kText1Style,
                ),
                InkWell(
                  onTap: (){
                    String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
                    String imagePath = imageFile?.path ?? '';

                    controller.addContact(uniqueId, name.text, imagePath, phone.text, addrees.text,);
                    Get.back();

                  },
                  child: const Text(
                    'Xong',
                    style: kButtonStyle,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              width: 150,
                height: 150,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  color: Colors.black54
                ),
                child: imageFile != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.file(
                    imageFile!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
                    : const Icon(Icons.person, size: 120, color: Colors.white)),
            InkWell(
              onTap: _pickImage,
              child: const Text(
                'Thêm ảnh',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.white12,
                      width: 1
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Phone',
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.white12,
                        width: 1
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                ),
              ),
            ),
            TextField(
              controller: addrees,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Địa Chỉ',
                labelText: 'Địa Chỉ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.white12,
                      width: 1
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
