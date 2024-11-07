import 'package:get/get.dart';
import 'package:learn_getx/controller/cart_controller.dart';
import 'package:learn_getx/controller/contact_controller.dart';
import 'package:learn_getx/controller/product_controller.dart';



import '../controller/user_controller.dart';
import '../services/api_services.dart';

Future<void> registerServices() async {
  Get.put(
    HTTPService(),
  );
}

Future<void> registerControllers() async {
  Get.put(
    UserController(),
  );
  Get.put(
    ProductController(),
  );
  Get.put(
    CartController(),
  );
  Get.put(
    ContactController(),
  );
}
