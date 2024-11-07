


import 'package:flutter/material.dart';

//style
const TextStyle kContent1Style = TextStyle(fontSize: 13, fontWeight: FontWeight.w700);
const TextStyle kContentStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);
const TextStyle kContent2Style = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
const TextStyle kContent3Style = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
const TextStyle kTitleStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 12,
);
const TextStyle kLeadingStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 12,
);
const TextStyle kLeading1Style = TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600);
const TextStyle kButtonStyle = TextStyle(
    color: Colors.blue,
    fontSize: 15,
    fontWeight: FontWeight.w600
);
const TextStyle kButton1Style = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
const TextStyle kText1Style = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w700
);
const TextStyle kText2Style = TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);
const TextStyle kText3Style = TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600);


// text
const String ADD_PRODUCT = 'Add Product';
const String ADD_IMAGE = 'Nhập Link Image';
const String IMAGE = 'Image';
const String ADD_NAME = 'Nhập Name';
const String NAME = 'Name';
const String ADD_PRICE = 'Nhập Price';
const String PRICE = 'Price';
const String ADD_QUANTITY = 'Nhập Quantity';
const String QUANTITY = 'Quantity';
const String IMAGE_URL = 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp';
const String IMAGE_URL2 = 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp';
const String DETAIL_PRODUCT = 'Detail Product';

String formatVND(int amount) {
  String result;

  // Convert the amount to a string with commas

  if (amount < 0) {
    result = "- ₫${amount * -1}".replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match match) => '${match[1]},');
  } else {
    result = "₫$amount".replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match match) => '${match[1]},');
  }
  // Add the ₫ symbol at the beginning
  return result;
}
