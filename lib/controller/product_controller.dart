import 'dart:convert';
import 'package:get/get.dart';
import 'package:learn_getx/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadProductListFromStorage();
  }

  Future<void> addProductList(String? id, String imgUrl, String name, String price, String quantity, String quantityToCard) async {
    productList.add(ProductModel(
        id: id,
        imgUrl: imgUrl,
        name: name,
        price: price,
        quantity: quantity,
        quantityToCard: quantityToCard
    ));
    print('productList: $productList');
    saveProductListStorage();
  }

  void deleteProductList(int index) async {
    productList.removeAt(index);
    await saveProductListStorage();
  }


  Future<void> saveProductListStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> productJsonList = productList.map((product) => jsonEncode(product.toJson())).toList();
    await prefs.setStringList('productList', productJsonList);
  }


  Future<void> loadProductListFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productJsonList = prefs.getStringList('productList');
    if (productJsonList != null) {
      productList.value = productJsonList.map((productJson) => ProductModel.fromJson(jsonDecode(productJson))).toList();
    }
  }

}
