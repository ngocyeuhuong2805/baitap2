import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/cart_controller.dart';
import 'package:learn_getx/untils/constant.dart';
import 'package:learn_getx/widget/item_cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.find();
  bool check = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_backspace)),
      ),
      body: SingleChildScrollView(
        child: Obx(
            () => SizedBox(
              child: ListView.builder(
                itemCount: cartController.listProductCard.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                final product = cartController.listProductCard[index];
              return ItemCartWidget(productModel: product);
                        }),
            ),
        ),
      ),
      bottomNavigationBar: buildBottomCart(context, cartController),
    );
  }





  Padding buildBottomCart(BuildContext context, CartController cart) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width / 2,
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.redAccent,
                    Colors.pinkAccent,

                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10)),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.summarize_outlined,
                  color: Colors.white,
                ),

                Obx(
                    () =>  Text(
                    'Tổng tiền(${cart.listProductCardChoose.length})\n${formatVND(cart.toTalPriceProductToCart())}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2.7,
            height: 60,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.redAccent,
                    Colors.pinkAccent,

                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: const Text(
              'Thanh toán',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
