import 'package:get/get.dart';
import 'package:learn_getx/view/detail_product_screen.dart';
import 'package:learn_getx/view/drawer_menu/contact_screen.dart';
import 'package:learn_getx/view/drawer_menu/gallery_screen.dart';
import 'package:learn_getx/view/drawer_menu/home1_screen.dart';
import 'package:learn_getx/view/home_screen.dart';
import '../models/product_model.dart';
import '../view/bottom_navigation_bar/main_screen.dart';
import '../view/bottom_navigation_bar/profile_screen.dart';
import '../view/bottom_navigation_bar/settings_screen.dart';


class AppPage {
  static final routes = [
    GetPage(name: '/main', page: () => const MainScreen()),
    GetPage(name: '/profile', page: () => const ProfileScreen()),
    GetPage(name: '/settings', page: () => const SettingsScreen()),
    GetPage(name: '/contact', page: () => const ContactScreen()),
    GetPage(name: '/gallery', page: () => const GalleryScreen()),
    GetPage(name: '/home1', page: () => const Home1Screen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(
      name: '/detailProduct',
      page: () => DetailProductScreen(productModel: Get.arguments as ProductModel),
    ),


  ];

}