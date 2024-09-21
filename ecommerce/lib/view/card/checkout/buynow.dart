import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/detail_controller.dart';
import 'package:ecommerce/controller/order_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class buynow extends StatefulWidget {
  var id;
  buynow({super.key,required this.id});

  @override
  State<buynow> createState() => _buynowState();
}

class _buynowState extends State<buynow> {
  final detail = Get.put(detail_controller());
  final cart = Get.put(cart_controller());
  final order=Get.put(order_controller());
  String delevery_method = '1';
  String payment_method = '1';
  @override
  void initState() {
    cart.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Checkout"),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverList.builder(itemCount:  widget.id==null?cart.Cart.length:detail.products.length,itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red)
                ),
                height: 100,
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
                              final image=detail.products[index].images[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:  Image(
                                    image: NetworkImage("http://10.0.2.2:8000/Image/Product/Image/${image.image}"),
                                  ),
                                ),
                              );
                            },)
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding:  const EdgeInsets.all(5.0),
                        child: Stack(
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 10, right: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${widget.id==null?cart.Cart[index].product.title:detail.products[index].title}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
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
                                            "\$${widget.id==null?cart.Cart[index].product.price:detail.products[index].price}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "X${widget.id==null?cart.Cart[index].qty:cart.Counter}",
                                        style: const TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },),
          SliverList.builder(itemCount: widget.id==null?1:detail.products.length,itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                      color: Colors.white,
                    ),
                    child:   Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery method"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.store),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Pick up at Store".tr),
                                  ),
                                ],
                              ),
                              // Icon(Icons.arrow_forward_ios_sharp),
                              Container(
                                height: 12,
                                width: 12,
                                child: Radio(
                                  value: '1',
                                  groupValue: delevery_method,
                                  onChanged: (String? value) {
                                    setState(() {
                                      delevery_method = value!;
                                      print(delevery_method);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.door_front_door_outlined),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Delivery to Door".tr),
                                  ),
                                ],
                              ),
                              // Icon(Icons.arrow_forward_ios_sharp),
                              Container(
                                height: 12,
                                width: 12,
                                child: Radio(
                                  value: '0',
                                  groupValue: delevery_method,
                                  onChanged: (String? value) {
                                    setState(() {
                                      delevery_method = value!;
                                      print(delevery_method);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                      color: Colors.white,
                    ),
                    child:   Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(delevery_method=="1"?"Addresss Store":"Delevery Address"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  delevery_method=="1"?"House 1200, Street 3, Sangkat Boeung Keng Kang 2, Phnom Penh, Phnom Penh Province":"11111111111",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios_sharp),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                      color: Colors.white,
                    ),
                    child:  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text("Subtotal"), Text('\$${widget.id==null?cart.totalPrice:detail.products[index].price*cart.Counter.toInt()}')],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Shopping Fee"), Text('\$6.0')],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Tax Fee"), Text('\$0.6')],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Order Total :"), Text('\$6.0')],
                          ),
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Payment Method"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.payments_outlined),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Pay Onlion".tr),
                                  ),
                                ],
                              ),
                              // Icon(Icons.arrow_forward_ios_sharp),
                              Container(
                                height: 12,
                                width: 12,
                                child: Radio(
                                  value: '1',
                                  groupValue: payment_method,
                                  onChanged: (String? value) {
                                    setState(() {
                                      payment_method = value!;
                                      print(payment_method);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        delevery_method=="1"?
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.store),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Pay at Store".tr),
                                  ),
                                ],
                              ),
                              Container(
                                height: 12,
                                width: 12,
                                child: Radio(
                                  value: delevery_method=="1"?'0':"1",
                                  groupValue: payment_method,
                                  onChanged: (String? value) {
                                    setState(() {
                                      payment_method = value!;
                                      print(payment_method);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ):const Text(''),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },)
        ],
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 250,
          child: MaterialButton(
            onPressed: () {
              setState(() {
                if(widget.id==null){
                  print(cart.totalPrice);
                  order.store_more(cart.totalPrice);
                }else{
                  order.store_sigle(widget.id,cart.Counter);
                }
              });
            },
            child: Text(
              'Submit'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
              ),
            ),
            color: Colors.redAccent,
            minWidth: double.infinity,
            height: 60,
            elevation: 0,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
