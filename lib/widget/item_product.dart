import 'package:flutter/material.dart';
import 'package:learn_getx/untils/constant.dart';

import '../models/product_model.dart';
import '../view/detail_product_screen.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductScreen(productModel: productModel)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      productModel.imgUrl,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 7,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  top: 5,
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.greenAccent,
                    ),
                    child: const Text(
                      'Sale 50%',
                      style: kTitleStyle,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        productModel.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kTitleStyle
                    ),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Price: ${formatVND(int.parse(productModel.price))}',
                        style: kTitleStyle
                    ),
                  ),
                  const SizedBox(height: 4),

                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Đã mua: 500',
                        style: kTitleStyle
                    ),
                  ),
                  const SizedBox(height: 4),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Quantity: ${productModel.quantity}',
                        style: kTitleStyle
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}