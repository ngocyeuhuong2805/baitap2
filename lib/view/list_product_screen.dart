import 'package:flutter/material.dart';
import 'package:learn_getx/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:learn_getx/widget/dialog_add_product.dart';
import '../controller/cart_controller.dart';
import '../widget/item_product.dart';
import 'cart_screen.dart';
import 'package:badges/badges.dart' as badges;

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  ProductController userController = Get.find();
  final cartProvider = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    userController.productList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
        leading: InkWell(
          onTap: () {
            Get.back();
          } ,
            child: const Icon(Icons.keyboard_backspace)),
        centerTitle: true,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const CartScreen());
              },
              child: Obx(
                    () => badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.slide(
                    disappearanceFadeAnimationDuration:
                    Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: cartProvider.listProductCard.isNotEmpty,
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.red,
                  ),
                  badgeContent: Text(
                    cartProvider.listProductCard.isNotEmpty
                        ? cartProvider.listProductCard.length.toString()
                        : "",
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                itemCount: userController.productList.length,
                itemBuilder: (context, index) {
                  final product = userController.productList[index];
                  return ItemProduct(productModel: product);
                }
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return DiaLogAddProduct(size: MediaQuery.of(context).size,);
            },
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


