import 'package:ecommerce/controller/main_controller.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class main_page extends StatefulWidget {
  main_page({super.key});
  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  final main=Get.put(main_controller());
  final user=Get.put(user_controller());
  @override
  void initState() {
    user.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: main.page[main.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: main.index,
        onTap: (value) {
          setState(() {
            main.index=value;
          });
        },
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home".tr),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Categories".tr),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Carts".tr),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favorites".tr),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings".tr),
        ],
      ),
    );
  }
}
