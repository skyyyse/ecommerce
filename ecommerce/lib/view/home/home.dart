import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/detail_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/controller/slider_controller.dart';
import 'package:ecommerce/view/home/detail/detail.dart';
import 'package:ecommerce/view/home/widget/menu.dart';
import 'package:ecommerce/view/home/widget/product.dart';
import 'package:ecommerce/view/home/search/search.dart';
import 'package:ecommerce/view/home/widget/populor.dart';
import 'package:ecommerce/view/home/widget/slider.dart';
import 'package:ecommerce/view/account/profile/settings/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final product_data=Get.put(product_controller());
  final detail=Get.put(detail_controller());
  @override
  void initState() {
    product_data.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFe5e5e5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          height: 35,
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Get.to(search());
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Search for products".tr,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: (){
                Get.to(language());
              },
              child: Icon(
                Icons.language,
                size: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                slider(),
                menu(),
                populor(),
              ],
            ),
          ),
          Obx((){
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: product_data.products.length, (context, index) {
                  final products=product_data.products[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        Get.to(detail_page(id:products.id));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 1,itemBuilder: (context, index) {
                                  final image=products.images[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: NetworkImage(
                                        "http://10.0.2.2:8000/Image/Product/Image/${image.image}",
                                      ),
                                    ),
                                  );
                                },)
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products.title.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      products.description,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Price
                                    Text(
                                      "\$${products.price.toString()}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    // Container(
                                    //   height: 20,
                                    //   child: ListView.builder(itemCount: 1,itemBuilder: (context, index) {
                                    //     final image=products_data.images[index];
                                    //     return Text(image.image);
                                    //   },),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75,
              ),
            );
          }),
        ],
      ),
    );
  }
}
