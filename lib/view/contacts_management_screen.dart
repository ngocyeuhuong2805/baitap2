import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/contact_controller.dart';
import 'package:learn_getx/view/detail_contact_screen.dart';
import 'package:learn_getx/widget/bottom_sheet_add_contact.dart';
import 'package:learn_getx/widget/item_contact_widget.dart';

class ContactsManagementScreen extends StatefulWidget {
  const ContactsManagementScreen({super.key});

  @override
  State<ContactsManagementScreen> createState() => _ContactsManagementScreenState();
}

class _ContactsManagementScreenState extends State<ContactsManagementScreen> {
  ContactController contactController = Get.find();
  @override
  void initState() {
    // TODO: implement initState

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_backspace, color: Colors.blue)),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const BottomSheetAddContact();
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.add, color: Colors.blue, size: 30,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Liên hệ',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  onChanged: (value) => contactController.searchContact(value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Tìm kiếm',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: LineWidget(),
              ),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.network(
                        'https://scontent.fhan4-4.fna.fbcdn.net/v/t39.30808-6/185220803_2904710286433589_7617406288933508801_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_ohc=kFsXMLAUrXgQ7kNvgFWxsmE&_nc_zt=23&_nc_ht=scontent.fhan4-4.fna&_nc_gid=AVECaEAZl2FsNjM7qgZS1Wp&oh=00_AYD-ptVu8ztD_WVV0NtSrDES0bzlp0STOpgAoOHJRIicWg&oe=67321A79'
                        , width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 10,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nguyễn Thế Ngọc', style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text('Thẻ của tôi', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.grey),),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(

                  child: Obx(
                          () => ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (BuildContext context, int index) {
                              return PreferredSize(
                                preferredSize: const Size.fromHeight(6),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  height: 1, color: Colors.grey[300]
                                ),
                              );
                            },
                              itemCount: contactController.searchResults.length,
                              itemBuilder: (context, index) {
                              final contact = contactController.searchResults[index];
                            return InkWell(
                              onTap: (){
                                Get.to((DetailContactScreen(contactModel: contact,)));
                              },
                                child: ItemContactWidget(contactModel: contact));
                          },

                          )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: LineWidget(),
              )





            ],
          ),
        ),
      ),
    );
  }


}

class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery
            .sizeOf(context)
            .width,
        height: 1,
        color: Colors.grey[300]
    );
  }
}
