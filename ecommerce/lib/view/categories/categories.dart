import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:ecommerce/view/categories/subcategories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/subcategories_controller.dart';

class categories extends StatefulWidget {
  categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  final categorie = Get.put(categories_controller());
  @override
  void initState() {
    categorie.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe5e5e5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text("Categories".tr),
        centerTitle: true,
      ),
      body: Obx((){
        if (categorie.isloading.value) {
          return isloading();
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.75),
            itemCount: categorie.categories.length,
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) {
              final categories = categorie.categories[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Get.to(subcategories(id: categories.id,title: categories.title,));
                    });
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
                            height: 70,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "${categories.title}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
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