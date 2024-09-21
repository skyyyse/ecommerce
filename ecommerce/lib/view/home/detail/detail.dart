import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/view/account/widget/contact.dart';
import 'package:ecommerce/view/card/card.dart';
import 'package:ecommerce/view/card/checkout/buynow.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/detail_controller.dart';

class detail_page extends StatefulWidget {
  var id;
  detail_page({super.key, required this.id});
  @override
  State<detail_page> createState() => _detailState();
}

class _detailState extends State<detail_page> {
  final detail = Get.put(detail_controller());
  final favorite = Get.put(favorite_controller());
  final cart = Get.put(cart_controller());
  var price;
  @override
  void initState() {
    detail.get(widget.id);
    cart.Counter.value==1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe5e5e5),
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          "Product Details".tr,
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Obx(()=>detail.isloading.value?isloading():ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 1,
        itemBuilder: (context, index) {
          final products = detail.products[index];
          price = products.price;
          return Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(2, 3),
                          ),
                        ],
                        color: Colors.transparent,
                      ),
                      child: CarouselSlider(
                        items: products.images
                            .map((item) => Container(
                            height: 350,
                            decoration:  BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "http://10.0.2.2:8000/Image/Product/Image/${item.image}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                            .toList(),
                        carouselController: detail.carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 16 / 16,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              detail.currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                favorite.stote(products.id);
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: products.favorite.length == 0
                                  ? const Icon(
                                Icons.favorite_border,
                                size: 25,
                              )
                                  : const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: products.images.length==1?Colors.transparent:Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: products.images.length==1?Text(''):Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: products.images
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => detail.carouselController.animateToPage(entry.key),
                                        child: Container(
                                          width: detail.currentIndex == entry.key ? 20 : 7,
                                          height: 7.0, margin:
                                          const EdgeInsets.symmetric(
                                            horizontal: 3.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: detail.currentIndex == entry.key ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    products.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    products.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "\$${products.price}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Quantity"),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2, right: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          height: 30,
                          width: 110,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      cart.remove();
                                    });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right:
                                        BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    height: 35,
                                    width: 35,
                                    child: const Icon(
                                      Icons.remove,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 30,
                                  width: 40,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      cart.Counter().toString(),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      cart.add();
                                    });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left:
                                        BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    height: 30,
                                    width: 30,
                                    child: const Icon(
                                      Icons.add_outlined,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(card());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              height: 60,
                              width: 60,
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Carts".tr,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(contact());
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              height: 60,
                              width: 60,
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.account_circle_outlined,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Contact".tr,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 2),
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cart.Cart.length==0?Colors.white:Colors.red,
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child:cart.Cart.length==0?null: Text(
                            cart.Cart.length.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  var qty=cart.Counter;
                                  var totalprice=cart.Counter*price;
                                  cart.addCart(widget.id,qty,totalprice);
                                  print(totalprice);
                                  print(price);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                                height: 40,
                                child:  Center(
                                  child: Text(
                                    "Add to Cart".tr,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if(widget.id==null){
                                  print('object');
                                }else{
                                  detail.get(widget.id);
                                  Get.to(buynow(id: widget.id,));
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              height: 40,
                              child:  Center(
                                child: Text(
                                  "Buy now".tr,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
