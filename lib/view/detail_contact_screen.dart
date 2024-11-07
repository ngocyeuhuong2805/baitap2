import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:learn_getx/models/contact_model.dart';
import 'package:learn_getx/view/contacts_management_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/contact_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../untils/constant.dart';

class DetailContactScreen extends StatefulWidget {
  const DetailContactScreen({super.key, required this.contactModel});
  final ContactModel contactModel;

  @override
  State<DetailContactScreen> createState() => _DetailContactScreenState();
}

class _DetailContactScreenState extends State<DetailContactScreen> {
  ContactController contactController = Get.find();



  Future<void> _makingPhoneCall(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      debugPrint('Số điện thoại không hợp lệ');
      return;
    }

    if (await Permission.phone.request().isGranted) {

      final String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

      String finalNumber = cleanedNumber;
      if (!cleanedNumber.startsWith('+') && !cleanedNumber.startsWith('0')) {
        finalNumber = '0$cleanedNumber';
      }

      final urlString = 'tel://$finalNumber';

      try {
        final Uri uri = Uri.parse(urlString);
        if (!await launchUrl(uri)) {
          throw 'Không thể thực hiện cuộc gọi';
        }
      } catch (error) {
        debugPrint('Lỗi khi thực hiện cuộc gọi: $error');
      }
    } else {
      debugPrint('Quyền gọi điện chưa được cấp.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
        leading:  InkWell(
          onTap: (){
            Get.back();
          },
            child: const Icon(Icons.arrow_back_ios, color: Colors.blue,)),
        actions: [
          InkWell(
            onTap: () {
              contactController.deleteContact(widget.contactModel.id);
              Get.back();

            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text('Xóa',style: kLeading1Style,),
            ),
          )
        ],


      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      File(widget.contactModel.image),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: const Icon(Icons.error),
                        );
                      },
                    ),),
              ),
              widget.contactModel.name!.isNotEmpty && widget.contactModel.name != null
                 ?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.contactModel.name.toString(), style: kButton1Style,),
              )
                 :
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.contactModel.numberPhone, style: kButton1Style,),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WidgetDetailContact(icon: Icons.messenger, title: 'nhắn tin'),
                    WidgetDetailContact(icon: Icons.call, title: 'gọi'),
                    WidgetDetailContact(icon: Icons.video_camera_back_outlined, title: 'video'),
                    WidgetDetailContact(icon: Icons.mail_lock_rounded, title: 'gửi thư'),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
          
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('di động', style: kTitleStyle,),
                    const SizedBox(height: 5,),
                    InkWell(
                      onTap:  () async {
                       await  _makingPhoneCall(widget.contactModel.numberPhone);

                      } ,
                        child: Text(widget.contactModel.numberPhone.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue),))
          
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
          
                ),
                  child: const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Ghi chú',
                      hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
          
                    ),
          
                  ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
          
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gửi tin nhắn', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: LineWidget(),
                      ),
                      Text('Chia sẻ liên hệ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: LineWidget(),
                      ),
                      Text('Thêm vào mục ưa thích', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue)),
          
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
          
                ),
                child: const Text('Chia sẻ liên hệ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue),
                ),),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
          
                ),
                child: const Text('Chia sẻ vị trí của tôi', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue),
                ),),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
          
                ),
                child: const Text('Chặn người gọi này', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.red),
                ),),
          
          
            ],
          
          ),
        ),
      ),
    );
  }
}

class WidgetDetailContact extends StatelessWidget {
  final IconData icon;
  final String title;
  const WidgetDetailContact({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width/4.6,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue,),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.blue),)
        ],
      ),
    );
  }
}
