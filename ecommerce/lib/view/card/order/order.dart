import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/order_controller.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/product_controller.dart';
import '../checkout/buynow.dart';
import '../../home/detail/detail.dart';
import '../../main/main.dart';

class order extends StatefulWidget {
  order({super.key});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  final product = Get.put(product_controller());
  final order = Get.put(order_controller());
  @override
  void initState() {
    order.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe5e5e5),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Order"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Obx((){
        if(order.isLoading.value){
          return isloading();
        }else{
          if(order.Order.length==0){
            return Center(
              child: Container(
                height:250,
                width: 250,
                child: Image(
                  image: NetworkImage("https://imgs.search.brave.com/KEIFoFqBWZiaqDFeCz62gijzbM8ZfrRynGQ_aKiANb8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS12ZWN0b3Iv/bm8tZGF0YS1jb25j/ZXB0LWlsbHVzdHJh/dGlvbl8xMTQzNjAt/NjI2LmpwZz9zaXpl/PTYyNiZleHQ9anBn"),
                ),
              ),
            );
          }else{
            return CustomScrollView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                SliverList.builder(itemCount: order.Order.length,itemBuilder: (context, index) {
                  final orders=order.Order[index];
                  final totalQty = orders.item.fold(0, (sum, item) => sum + item.qty);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red)
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.red)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: orders.item.length,itemBuilder: (context, index) {
                                    final items=orders.item[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: 100,
                                      width: 100,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Padding(
                                              padding:  EdgeInsets.all(5.0),
                                              child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 1,itemBuilder: (context, index) {
                                                final images=items.product.images[index];
                                                return  ClipRRect(
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: Image(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage("http://10.0.2.2:8000/Image/Product/Image/${images.image}"),
                                                  ),
                                                );
                                              },),
                                            ),
                                          )
                                      ),
                                    );
                                  },),
                                )
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Price"),
                                InkWell(
                                  onTap: (){
                                    order.cancel(orders.id);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text("Cancel",style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.payments_outlined),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Total Price".tr),
                                    ),
                                  ],
                                ),
                                Text('\$${orders.totalprice}')
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.shopping_cart_outlined),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Total Product".tr),
                                    ),
                                  ],
                                ),
                                Text("X${orders.item.length}")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.numbers),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Total Quality".tr),
                                    ),
                                  ],
                                ),
                                Text("X${totalQty}")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },),
              ],
            );
          }
        }
      }),
    );
  }
}
