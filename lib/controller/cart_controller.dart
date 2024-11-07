import 'dart:convert';

import 'package:get/get.dart';
import 'package:learn_getx/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  RxList<ProductModel> listProductCard = <ProductModel>[].obs;
  RxList<ProductModel> listProductCardChoose = <ProductModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadProductListCardFromStorage();
  }
  void addProductToCart(ProductModel product, String quantityToCard){
    listProductCard.add(ProductModel(id: product.id, name: product.name, price: product.price, imgUrl: product.imgUrl, quantity: product.quantity, quantityToCard: quantityToCard));
    print('listProductCard : ${listProductCard}');
    saveProductListCardStorage();
  }
  void deleteProductToCart (int index) async {
    listProductCard.removeAt(index);
    await saveProductListCardStorage();
  }
  Future<void> saveProductListCardStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> productJsonList = listProductCard.map((product) => jsonEncode(product.toJson())).toList();
    await prefs.setStringList('listProductCard', productJsonList);
  }


  Future<void> loadProductListCardFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productJsonList = prefs.getStringList('listProductCard');
    if (productJsonList != null) {
      listProductCard.value = productJsonList.map((productJson) => ProductModel.fromJson(jsonDecode(productJson))).toList();
    }
  }
  int toTalPriceProductToCart (){
    int total = 0;
    for(ProductModel product in listProductCardChoose){
      total += int.parse(product.price) * int.parse(product.quantityToCard);
    }
    print('totalPrice : ${total.toInt()}');
    return total.toInt();
  }
  void updateProductToCart(String productId, int newQuantity) {
    int index = listProductCard.indexWhere((product) => product.id == productId);
    if (index != -1) {
      listProductCard[index].quantityToCard = newQuantity.toString();
      saveProductListCardStorage();
    } else {
      print('Sản phẩm với ID $productId không tìm thấy trong giỏ hàng.');
    }
  }
  void toggleProductSelection(ProductModel product) {
    if (listProductCardChoose.contains(product)) {
      listProductCardChoose.remove(product);
    } else {
      listProductCardChoose.add(product);
      print('listProductCardChoose : ${listProductCardChoose}');
    }
    update();
  }

}