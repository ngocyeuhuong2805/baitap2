import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/product_controller.dart';
import '../untils/constant.dart';
import 'dia_log_add_user.dart';

class DiaLogAddProduct extends StatefulWidget {
  const DiaLogAddProduct({super.key, required this.size});
  final Size size;

  @override
  State<DiaLogAddProduct> createState() => _DiaLogAddProductState();
}

class _DiaLogAddProductState extends State<DiaLogAddProduct> {
  TextEditingController image = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: widget.size.width * 0.80,
          height: widget.size.height * 0.50,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                ADD_PRODUCT,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              TextFieldWidget(
                controller: image,
                hintText: ADD_IMAGE,
                labelText: IMAGE,
              ),
              TextFieldWidget(
                controller: name,
                hintText: ADD_NAME,
                labelText: ADD_NAME,
              ),
              TextFieldWidget(
                  controller: price,
                  hintText: ADD_PRICE,
                  labelText: PRICE),
              TextFieldWidget(
                  controller: quantity,
                  hintText: ADD_QUANTITY,
                  labelText: QUANTITY),
              InkWell(
                onTap: () async {
                  String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
                  await controller.addProductList(
                      uniqueId, image.text.toString(),
                      name.text, price.text, quantity.text, '1');
                  image.clear();
                  name.clear();
                  price.clear();
                  quantity.clear();
                  // Update UI
                  controller.update();
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  width: widget.size.width / 3,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Add'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
