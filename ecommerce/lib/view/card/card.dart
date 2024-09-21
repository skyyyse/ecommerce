import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/view/card/checkout/buynow.dart';
import 'package:ecommerce/view/home/detail/detail.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:ecommerce/view/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class card extends StatefulWidget {
  card({super.key});

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  final cart = Get.put(cart_controller());
  final product = Get.put(product_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text("Carts".tr),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Obx(() {
          if (cart.isloading.value) {
            return isloading();
          } else {
            if(cart.Cart.length==0){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:250,
                      width: 250,
                      child: Image(
                        image: AssetImage("assets/img/empty_cart.png"),
                      ),
                    ),
                    Text("Favorites".tr),
                  ],
                ),
              );
            }else{
              return ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: cart.Cart.length,
                itemBuilder: (context, index) {
                  final carts = cart.Cart[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 5 / 16,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              cart.delete_cart(carts.id);
                            });
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // product.detail(carts.product.id);
                            // Get.to(detail());
                          });
                        },
                        child: Container(
                          height: 100,
                          color: Colors.white,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: 100,
                                      width: 100,
                                      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 1,itemBuilder: (context, index) {
                                        final image=carts.product.images[index];
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child:  Image(
                                            image: NetworkImage("http://10.0.2.2:8000/Image/Product/Image/${image.image}"),
                                          ),
                                        );
                                      },)
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 10, right: 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      carts.product.title,
                                                      maxLines: 2,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 8, right: 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "\$${carts.totalprice}",
                                                      maxLines: 1,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2, right: 2),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: Colors.blue,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  height: 30,
                                                  width: 110,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          decoration:
                                                          const BoxDecoration(
                                                            border: Border(
                                                              right: BorderSide(
                                                                color:
                                                                Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                          height: 30,
                                                          width: 30,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                int qty = carts.qty - 1;
                                                                int totalprice = qty * carts.product.price.toInt();
                                                                if (qty <= 0) {
                                                                  print('object');
                                                                  print(qty);
                                                                } else {
                                                                  cart.addCounter(carts.id, qty, totalprice);
                                                                }
                                                              });
                                                            },
                                                            child: const Icon(
                                                              Icons.remove,
                                                              size: 15,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          height: 30,
                                                          width: 40,
                                                          color: Colors.blue,
                                                          child: Center(
                                                            child: Text(
                                                              carts.qty
                                                                  .toString(),
                                                              style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          decoration:
                                                          const BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            border: Border(
                                                              left: BorderSide(
                                                                color:
                                                                Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                          height: 30,
                                                          width: 30,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                int qty = carts.qty + 1;
                                                                int totalprice = qty * carts.product.price.toInt();
                                                                cart.addCounter(
                                                                  carts
                                                                      .id,
                                                                  qty,
                                                                  totalprice,
                                                                );
                                                              });
                                                            },
                                                            child: const Icon(
                                                              Icons.add_outlined,
                                                              size: 15,
                                                              color: Colors.white,
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
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        }),
      ),
      bottomNavigationBar: cart.Cart.length==0?Text(''):Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Price: \$${cart.totalPrice.toInt()}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      "",
                                      // "\$${cart.totalPrice.toStringAsFixed(2)}",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shopping fee :",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "\$1",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(buynow(id: null));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 150,
                    child: const Center(
                      child: Text(
                        "Settlement",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
