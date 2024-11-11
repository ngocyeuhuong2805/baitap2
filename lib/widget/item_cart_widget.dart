import 'package:flutter/material.dart';
import 'package:learn_getx/models/product_model.dart';
import 'package:learn_getx/untils/constant.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';

class ItemCartWidget extends StatefulWidget {
  const ItemCartWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ItemCartWidget> createState() => _ItemCartWidgetState();
}

class _ItemCartWidgetState extends State<ItemCartWidget> {
  final cartController = Get.find<CartController>();
  bool check = false;
  int quantity = 1;

  late int itemPrice = 0;


  @override
  void initState() {
    super.initState();
    quantity = int.parse(widget.productModel.quantityToCard);
    itemPrice = int.parse(widget.productModel.price);
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = itemPrice * quantity;

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 2,
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.grey[200],
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 70,
          child: Row(
            children: [
              buildCheckBox(),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.productModel.imgUrl,
                  width: 60,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10,),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productModel.name, style: kContentStyle),
                    Text('Price: ${formatVND(totalPrice.toInt())}', style: kContentStyle,), // Update price displayed
                    Text('Đã bán : ${widget.productModel.quantity}', style: kContentStyle),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                                cartController.updateProductToCart(widget.productModel.id, quantity);
                              }
                            },
                            icon: const Icon(Icons.remove, size: 16),
                          ),
                        ),
                        Container(
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              quantity.toString(),
                              style: kLeadingStyle,
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                              cartController.updateProductToCart(widget.productModel.id, quantity);
                            },
                            icon: const Icon(Icons.add, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildCheckBox() {
    return GestureDetector(
      onTap: (){
        setState(() {
          check = !check;
          cartController.toggleProductSelection(widget.productModel);
        });
      },
      child: check
          ? Container(
        margin: const EdgeInsets.all(16),
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.black,
          size: 16,
        ),
      )
          : Container(
        margin: const EdgeInsets.all(16),
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }
}
