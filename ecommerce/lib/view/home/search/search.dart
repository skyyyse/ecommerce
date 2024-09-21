import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../detail/detail.dart';
import '../widget/product.dart';

class search extends StatefulWidget {
  search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final controller = Get.put(product_controller());
  @override
  void initState() {
    controller.updateSearchText("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.get();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 25,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            focusColor: Colors.white,
            highlightColor: Colors.white,
            hoverColor: Colors.white,
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextField(
              onChanged: (value) => controller.updateSearchText(value),
              cursorHeight: BorderSide.strokeAlignCenter,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                helperStyle: TextStyle(fontSize: 2),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isloading.value) {
          return const isloading();
        } else if (controller.filteredProducts.isEmpty) {
          return Center(
            child: Container(
              height: 250,
              width: 250,
              child: const Image(
                image: NetworkImage(
                    "https://imgs.search.brave.com/KEIFoFqBWZiaqDFeCz62gijzbM8ZfrRynGQ_aKiANb8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS12ZWN0b3Iv/bm8tZGF0YS1jb25j/ZXB0LWlsbHVzdHJh/dGlvbl8xMTQzNjAt/NjI2LmpwZz9zaXpl/PTYyNiZleHQ9anBn",
                ),
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
            physics:
                const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: controller.filteredProducts.length,
            itemBuilder: (context, index) {
              final products = controller.filteredProducts[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    Get.to(detail_page(id: products.id));
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products.title.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  products.description,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Price
                                Text(
                                  "\$${products.price.toString()}",
                                  style: const TextStyle(
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
          );
        }
      }),
    );
  }
}
