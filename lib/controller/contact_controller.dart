import 'dart:convert';
import 'package:get/get.dart';
import 'package:learn_getx/models/contact_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactController extends GetxController {
  RxList<ContactModel> listContact = <ContactModel>[].obs;
  RxList<ContactModel> searchResults = <ContactModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadContactListFromStorage();
    searchResults.value = List.from(listContact);
  }

  void addContact(String id, String? name, String image, String numberPhone, String address) {
    listContact.add(
        ContactModel(
            id: id,
            name: name ?? '',
            image: image,
            numberPhone: numberPhone,
            address: address
        )
    );

    searchResults.value = List.from(listContact);
    saveContactListStorage();
  }
  void deleteContact(String id) {
    listContact.removeWhere((contact) => contact.id == id);

    searchResults.value = List.from(listContact);
    update();
    saveContactListStorage();
  }
  Future<void> saveContactListStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> contactJsonList = listContact.map((contact) => jsonEncode(contact.toJson())).toList();
    await prefs.setStringList('contactList', contactJsonList);
  }
  Future<void> loadContactListFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? contactJsonList = prefs.getStringList('contactList');
    if (contactJsonList != null) {
      listContact.value = contactJsonList.map((contactJson) => ContactModel.fromJson(jsonDecode(contactJson))).toList();
      searchResults.value = List.from(listContact);
    }
  }
  void searchContact(String query) {
    if (query.isEmpty) {

      searchResults.value = List.from(listContact);
      return;
    }

    query = query.toLowerCase();

    searchResults.value = listContact.where((contact) {
      final nameMatch = contact.name?.toLowerCase().contains(query) ?? false;
      final phoneMatch = contact.numberPhone.toLowerCase().contains(query);
      return nameMatch || phoneMatch;
    }).toList();
  }
}