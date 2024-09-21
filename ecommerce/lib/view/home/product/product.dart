import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/view/home/detail/detail.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ecommerce/view/home/widget/product.dart';

class product extends StatefulWidget {
  var id;
  product({super.key, required this.id});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  final products = Get.put(product_controller());
  @override
  void initState() {
    products.getid(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (products.isloading.value) {
          return const isloading();
        } else {
          if (products.products.length == 0) {
            return Center(
              child: Container(
                height: 250,
                width: 250,
                child: Image(
                  image: NetworkImage(
                      "https://imgs.search.brave.com/KEIFoFqBWZiaqDFeCz62gijzbM8ZfrRynGQ_aKiANb8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS12ZWN0b3Iv/bm8tZGF0YS1jb25j/ZXB0LWlsbHVzdHJh/dGlvbl8xMTQzNjAt/NjI2LmpwZz9zaXpl/PTYyNiZleHQ9anBn"),
                ),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75,
              ),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: products.products.length,
              itemBuilder: (context, index) {
                final products_data = products.products[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      Get.to(detail_page(id: products_data.id));
                    });
                  },
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
                            final image=products_data.images[index];
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
                                  products_data.title.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  products_data.description,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Price
                                Text(
                                  "\$${products_data.price.toString()}",
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
                );
              },
            );
          }
        }
      }),
    );
  }
}
