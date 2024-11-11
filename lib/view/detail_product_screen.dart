import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_getx/controller/cart_controller.dart';
import 'package:learn_getx/controller/product_controller.dart';
import 'package:learn_getx/models/product_model.dart';
import 'package:get/get.dart';
import 'package:learn_getx/untils/constant.dart';
import 'package:learn_getx/view/cart_screen.dart';
import 'package:badges/badges.dart' as badges;
import '../widget/item_product.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int quantity = 1;
  final controller = Get.put(ProductController());
  final cartProvider = Get.put(CartController());
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(DETAIL_PRODUCT),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: const Icon(Icons.keyboard_backspace)),
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
                  child: SvgPicture.asset(
                    'asset/icons/shopping_cart1.svg',
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,


      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(onPressed: (){
        cartProvider.addProductToCart(widget.productModel, quantity.toString());
      },
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    widget.productModel.imgUrl,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10,),
              Text(widget.productModel.name.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20,), overflow: TextOverflow.ellipsis, maxLines: 2,),
              const SizedBox(height: 10,),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {

                      if (kDebugMode) {
                        print(rating);
                      }
                    },
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(5)',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Text('Price: ${formatVND(int.parse(widget.productModel.price))}đ', style: kContentStyle),
              const SizedBox(height: 10,),
              Text('Quantity: ${widget.productModel.quantity}', style: kContentStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Đã mua: 500',
                    style: kContentStyle,
                  ),
                  const SizedBox(width: 8),


                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 0) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),


                      Text(
                        quantity.toString(),
                        style: kContent2Style,
                      ),


                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                'Có thể bạn cũng thích',
                style: kContent2Style,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  child: Obx(
                        () => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                        ),
                        itemCount: controller.productList.length,
                        itemBuilder: (context, index) {
                          final product = controller.productList[index];
                          return ItemProduct(productModel: product);
                        }
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Container buildBottomNavigationBar(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width/2,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: const Text('Mua Ngay', style: kContent3Style),
    );
  }
}
