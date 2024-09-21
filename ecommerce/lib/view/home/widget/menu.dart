import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/controller/subcategories_controller.dart';
import 'package:ecommerce/view/categories/categories.dart';
import 'package:ecommerce/view/categories/subcategories/sub_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class menu extends StatefulWidget {
  menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  final categorie = Get.put(categories_controller());
  final subcategories_data = Get.put(subcategories_controller());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              height: 60,
              width: 100,
              child: Center(
                  child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    height: 60,
                    width: double.infinity,
                    child:  Center(
                      child: Text(
                        "All Categories".tr,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                      ),
                    ),
                    height: 40,
                    width: 100,
                    child:  Center(
                      child: Text(
                        "Menu".tr,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          Container(
            height: 92,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Adjust based on your design
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: categorie.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final categories = categorie.categories[index];
                return InkWell(
                  onTap: () {
                    Get.to(subcategories(
                      id: categories.id,
                      title: categories.title,
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Image(
                            image: NetworkImage(
                              'http://10.0.2.2:8000/Image/Categories/Image/${categories.image}',
                            ),
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                                                   ),
                         ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "${categories.title}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
